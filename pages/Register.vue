<template>
	<div>

		<div class="div-register">
			<br>
			<hr width=80% size=3>
			<div class="div-register-main2 ">

				<!-- div-register-main  -->
				<div class="container div-container">
					<h4>สมัครสมาชิก</h4>
					<div class="row">
						<div class="col-sm-2"><label for="textarea-small">user:</label></div>
						<div class="col-sm-10">
							<input v-model="form.user" id="input_user" type="text" placeholder="Enter user"
								class="form-control">
							<span id="input_user_err" class="err-msg-Register"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2"><label for="textarea-small">name :</label></div>
						<div class="col-sm-10">
							<input v-model="form.name" id="input_name" type="text" placeholder="Enter name"
								class="form-control">
							<span id="input_name_err" class="err-msg-Register"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2"><label for="textarea-small">phone:</label></div>
						<div class="col-sm-10">
							<input v-model="form.phone" id="input_phone" type="text" placeholder="Enter phone"
								class="form-control">
							<span id="input_phone_err" class="err-msg-Register"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2"><label for="textarea-small">password:</label></div>
						<div class="col-sm-10">
							<input v-model="form.password" id="input_password" type="text" placeholder="Enter password"
								class="form-control">
							<span id="input_password_err" class="err-msg-Register"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3"><label for="textarea-small">user_status:</label></div>
						<div class="col-sm-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1"
									value="admin" v-model="form.user_status">
								<label class="form-check-label" for="inlineRadio1">admin</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2"
									value="user" v-model="form.user_status">
								<label class="form-check-label" for="inlineRadio2">user</label>
							</div>
						</div>
					</div>
					<div class="register-div-button "><button type="button" class="btn btn-primary"
							@click="Register(), validate_Register()">สมัครสมาชิก</button></div>
				</div>
			</div>
			<hr width=80% size=3>
		</div>
		<!-- <div class="password_show">
			<input class="form-check-input mt-0" type="checkbox" v-model="show_User_List">
			<li>แสดงรายการข้อมูลผู้ใช้งาน</li>

		</div> -->

		<!-- <User_List v-if="show_User_List" /> -->
		<br>
	</div>
</template>

<script>
import axios from 'axios';
import { URL_API, URL_PUST_REGISTER } from '../constants';
import Swal from 'sweetalert2';
// import User_List from './User_List.vue';





export default {
	data() {
		return {
			show_User_List: false,
			form: {
				user: "",
				name: "",
				phone: "",
				password: "",
				user_status: "user",
			},
			get: []
		};
	},
	mounted() {

	},

	methods: {
		validate_Register() {
			let check = true;
			if (!this.form.user) {
				check = false;
				document.getElementById("input_user").style.border = "3px solid red";
				document.getElementById("input_user_err").innerHTML =
					"please enter user";
			}
			if (!this.form.name) {
				check = false;
				document.getElementById("input_name").style.border = "3px solid red";
				document.getElementById("input_name_err").innerHTML =
					"please enter name";
			}
			if (!this.form.phone) {
				check = false;
				document.getElementById("input_phone").style.border = "3px solid red";
				document.getElementById("input_phone_err").innerHTML =
					"please enter phone";
			}
			if (!this.form.password) {
				check = false;
				document.getElementById("input_password").style.border = "3px solid red";
				document.getElementById("input_password_err").innerHTML =
					"please enter password";
			}
			return check;
		},
		Register() {
			if (this.validate_Register()) {
				axios.post(`${URL_PUST_REGISTER}`, {
					users_name: this.form.user,
					names: this.form.name,
					phone: this.form.phone,
					password: this.form.password,
					user_status: this.form.user_status,
				}).then(response => {
					console.log(response);
					if (response.data.status === "ok") {
						Swal.fire({
							position: "center",
							icon: "success",
							title: "สมัครสมาชิกสำเร็จ",
							showConfirmButton: false,
							timer: 1500
						}).then(() => {
							this.form.user = "",
							this.form.name= "",
							this.form.phone= "",
							this.form.password= "",
							this.form.user_status= "user"
							
							// window.location.replace(`/Register`);
						});
					}
					if (response.data.status === "error") {
						alert("error");
					}
					if (response.data.status === "err") {
						alert("err");
					}
				}).catch(function (error) {
					console.log(error);
				});
			}
		}
	},

	watch: {
		show_User_List() {
			if (this.show_User_List) {
				const Toast = Swal.mixin({
					toast: true,
					position: 'top-end',
					showConfirmButton: false,
					timer: 3000,
					timerProgressBar: true,
					didOpen: (toast) => {
						toast.addEventListener('mouseenter', Swal.stopTimer)
						toast.addEventListener('mouseleave', Swal.resumeTimer)
					}
				})

				Toast.fire({
					icon: 'success',
					title: 'เปิดแสดงรายการข้อมูลผู้ใช้งาน',
					text: "รายการข้อมูลผู้ใช้งานจะอยู่ด้านล่าง!",
				})
			} else {
				const Toast = Swal.mixin({
					toast: true,
					position: 'top-end',
					showConfirmButton: false,
					timer: 3000,
					timerProgressBar: true,
					didOpen: (toast) => {
						toast.addEventListener('mouseenter', Swal.stopTimer)
						toast.addEventListener('mouseleave', Swal.resumeTimer)
					}
				})

				Toast.fire({
					icon: 'success',
					title: 'ปิดแสดงรายการข้อมูลผู้ใช้งาน',
					text: "รายการข้อมูลผู้ใช้งานจะหายไป!",
				})
			}

		},
		"form.user"() {
			if (this.form.user) {
				document.getElementById("input_user").style.border = "1px solid #a3a3a3";
				document.getElementById("input_user_err").innerHTML = "";
			}
			else {
				document.getElementById("input_user").style.border = "3px solid red";
				document.getElementById("input_user_err").innerHTML =
					"please enter user";
			}
		},
		"form.name"() {
			if (this.form.name) {
				document.getElementById("input_name").style.border = "1px solid #a3a3a3";
				document.getElementById("input_name_err").innerHTML = "";
			}
			else {
				document.getElementById("input_name").style.border = "3px solid red";
				document.getElementById("input_name_err").innerHTML =
					"please enter name";
			}
		},
		"form.phone"() {
			if (this.form.phone) {
				document.getElementById("input_phone").style.border = "1px solid #a3a3a3";
				document.getElementById("input_phone_err").innerHTML = "";
			}
			else {
				document.getElementById("input_phone").style.border = "3px solid red";
				document.getElementById("input_phone_err").innerHTML =
					"please enter phone";
			}
		},
		"form.password"() {
			if (this.form.password) {
				document.getElementById("input_password").style.border = "1px solid #a3a3a3";
				document.getElementById("input_password_err").innerHTML = "";
			}
			else {
				document.getElementById("input_password").style.border = "3px solid red";
				document.getElementById("input_password_err").innerHTML =
					"please enter password";
			}
		},
	},
	computed: {},
	// components: { User_List }
}

// onCurrentPage: function (page) {
//       this.$emit("pagechanged", page);
//     },
</script>

<style>
.div-register {
	display: flex;
	flex-direction: column;
	flex-wrap: nowrap;
	justify-content: flex-start;
	align-items: center;
	margin-top: 25px;
	z-index: 1;
}

.div-register-main {
	display: flex;
	flex-direction: column;
	flex-wrap: nowrap;
	justify-content: center;
	/* background-color: #2D3142; */
	width: 60%;
	min-height: 640px;
	align-items: center;
	border-radius: 10px;
	background: linear-gradient(225deg, #f0f0f0, #cacaca);
	box-shadow: -29px 29px 58px #8f8f8f,
		29px -29px 10px #ffffff;
}

.div-register-main2 {
	width: 100%;
	display: flex;
	justify-content: center;
}

.div-container {
	display: flex;
	row-gap: 40px;
	flex-direction: column;
	margin: 20px 0px 20px 0px;
}

.register-div-button {
	display: flex;
	justify-content: center;
}

@media screen and (max-width: 900px) {
	.div-register-main {

		width: 85%;
	}

	@media screen and (max-width: 700px) {
		.div-register-main {
			width: 90%;
		}
	}
}

.password_show {
	display: flex;
	width: 85%;
	align-items: center;
	grid-column-gap: 10px;
	-moz-column-gap: 10px;
	column-gap: 10px;
	margin: -7px 3px 0px 113px;
}
</style>