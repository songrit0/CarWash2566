<template>
	<div class="div-register">
		<div class="div-register-main ">
			<div class="container div-container">
				<h4>แก้ไขข้อมูลสมาชิก</h4>
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
				<div class="row" v-if=" $store.state.newUSER.user_status === 'admin'">
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
						@click="Register(), validate_Register()">บันทึก</button></div>

			</div>

		</div>
	</div>
</template>

<script>
import axios from 'axios';
import { URL_API, URL_GET_USER, URL_PUST_EDIT_USER } from '../constants';
import Swal from 'sweetalert2';

export default {
	name: 'Edit_User',
	data() {
		return {
			form: {
				user: '',
				name: '',
				phone: '',
				password: '',
				user_status: 'user',
			},
			user: []
		}
	},
	methods: {
		validate_Register() {
			let check = true
			if (!this.form.user) {
				check = false
				document.getElementById('input_user').style.border = '3px solid red'
				document.getElementById('input_user_err').innerHTML =
					'please enter user'
			}
			if (!this.form.name) {
				check = false
				document.getElementById('input_name').style.border = '3px solid red'
				document.getElementById('input_name_err').innerHTML =
					'please enter name'
			}
			if (!this.form.phone) {
				check = false
				document.getElementById('input_phone').style.border = '3px solid red'
				document.getElementById('input_phone_err').innerHTML =
					'please enter phone'
			}
			if (!this.form.password) {
				check = false
				document.getElementById('input_password').style.border = '3px solid red'
				document.getElementById('input_password_err').innerHTML =
					'please enter password'
			}
			return check
		},
		Register() {
			if (this.validate_Register()) {
				const getid = this.$route.query.id
				console.log(this.$route.query.id);
				axios.put(`${URL_PUST_EDIT_USER}/${getid}`, {
					users_name: this.form.user,
					names: this.form.name,
					phone: this.form.phone,
					password: this.form.password,
					user_status: this.form.user_status,
					// users_name: "ming126",
					// password: "12345",
					// user_status: "99",
					// names: "9999",
					// phone: 9999
				}).then(
					response => {
						console.log(response);
						if (response.data.status === 'ok') {
							Swal.fire({
								position: 'center',
								icon: 'success',
								title: 'บันทึกสำเร็จ',
								showConfirmButton: false,
								timer: 1500
							}).then(() => {
								this.$router.back(1)
							
							})


						} if (response.data.status === 'error') {
							alert("error")
						} if (response.data.status === 'err') {
							alert("err")
						}
					}
				).catch(function (error) {
					console.log(error);
				});
			}

		}
	},
	mounted() {
		//getid
		const getid = this.$route.query.id
		console.log(this.$route.query.id);
		axios.get(`${URL_GET_USER}/${getid}`).then(response => {
			console.log(response);
			this.form.user = response.data.results[0].users_name
			this.form.name = response.data.results[0].names
			this.form.phone = response.data.results[0].phone
			this.form.password = response.data.results[0].password
			this.form.user_status = response.data.results[0].user_status

		})

	},
	watch: {
		'form.user'() {
			if (this.form.user) {
				document.getElementById('input_user').style.border = '0px solid red'
				document.getElementById('input_user_err').innerHTML = ''
			} else {
				document.getElementById('input_user').style.border = '3px solid red'
				document.getElementById('input_user_err').innerHTML =
					'please enter user'
			}
		},
		'form.name'() {
			if (this.form.name) {
				document.getElementById('input_name').style.border = '0px solid red'
				document.getElementById('input_name_err').innerHTML = ''
			} else {
				document.getElementById('input_name').style.border = '3px solid red'
				document.getElementById('input_name_err').innerHTML =
					'please enter name'
			}
		},
		'form.phone'() {
			if (this.form.phone) {
				document.getElementById('input_phone').style.border = '0px solid red'
				document.getElementById('input_phone_err').innerHTML = ''
			} else {
				document.getElementById('input_phone').style.border = '3px solid red'
				document.getElementById('input_phone_err').innerHTML =
					'please enter phone'
			}
		},
		'form.password'() {
			if (this.form.password) {
				document.getElementById('input_password').style.border = '0px solid red'
				document.getElementById('input_password_err').innerHTML = ''
			} else {
				document.getElementById('input_password').style.border = '3px solid red'
				document.getElementById('input_password_err').innerHTML =
					'please enter password'
			}
		},
	},
	computed: {
	},
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
	margin-top: 40px;
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
</style>