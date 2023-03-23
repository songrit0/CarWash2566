<template>
	<div class="div-login-main">
		<div class="card" :style="Register_on ? 'top : 800px' : 'top : 0px '">
			<h1>login</h1>
			<!-- input User -->
			<div class="input-div">
				<div class="input-group"> <b class="a-User" id="a-User">User</b>
					<input id="input_user_login" v-model="formlogin.user" type="text" class="input" placeholder="User"
						autocomplete="off" style="border-radius: 0 6px 6px 0;">
					<span id="input_user_login_err" class="err-msg-login"></span>
				</div>
				<div class="input-group"> <b class="a-User " id="a-password">password</b>
					<input id="input_password_login" v-model="formlogin.password" @keydown.enter="login(), validate_login()"
						:type="password_show ? 'text' : 'password'" class="input-password" placeholder="password"
						autocomplete="off " style="border-radius: 0px 6px 6px 0px;">
					<span id="input_password_login_err" class="err-msg-login"></span>
				</div>
			</div>
			<div class="password_show"><input class="form-check-input mt-0" type="checkbox" v-model="password_show">
				<li>show password?</li>
			</div>
			<!-- end input User -->
			<button @click="login(), validate_login()">Login</button>
			<a @click="buttonbacks()" style="cursor: pointer;">Sign Up</a>
		</div>
		<div style="position: fixed; z-index: 6; width: 100%; height: 100%; transition: all .5s;"
			:style="Register_on ? 'top : 0px' : 'top : -800px'">
			<div class="">
				<div class="div-register">

					<div class="div-register-main ">
						<button class="button-back" @click="buttonbacks()">X</button>
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
									<input v-model="form.password" id="input_password" type="text"
										placeholder="Enter password" class="form-control">
									<span id="input_password_err" class="err-msg-Register"></span>
								</div>
							</div>
							<div class="register-div-button "><button type="button" class="btn btn-primary"
									@click="Register(), validate_Register()">สมัครสมาชิก</button></div>

						</div>

					</div>
				</div>
			</div>

		</div>

	</div>
</template>

<script>
import Swal from 'sweetalert2'
import axios from 'axios'
import { URL_PUST_LOGIN, URL_PUST_REGISTER } from '../constants'
export default {
	data() {
		return {
			password_show: false,
			Register_on: false,
			form: {
				user: null,
				name: null,
				phone: null,
				password: null,
				user_status: 'user',
			},
			formlogin: {
				user: '',
				password: '',
			},


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
		validate_login() {
			let check = true
			if (!this.formlogin.user) {
				check = false
				document.getElementById('a-User').style.backgroundColor = 'red'
				document.getElementById('input_user_login').style.border = '3px solid red'
				document.getElementById('input_user_login').style.borderRadius = '0px 6px 6px 0'
				document.getElementById('input_user_login_err').innerHTML =
					'please enter user'
			}
			if (!this.formlogin.password) {
				check = false
				document.getElementById('a-password').style.backgroundColor = 'red'
				document.getElementById('input_password_login').style.border = '3px solid red'
				document.getElementById('input_password_login').style.borderRadius = '0px 6px 6px 0'
				document.getElementById('input_password_login_err').innerHTML =
					'please enter password'
			}
			return check
		},
		buttonbacks() {
			this.form.user = null,
				this.form.name = null,
				this.form.phone = null,
				this.form.password = null,
				this.form.user_status = 'user',
				this.Register_on = !this.Register_on
			setTimeout(() => {
				document.getElementById('input_user').style.border = '1px solid #a3a3a3'
				document.getElementById('input_user_err').innerHTML =
					' '
				document.getElementById('input_name').style.border = '1px solid #a3a3a3'
				document.getElementById('input_name_err').innerHTML =
					' '
				document.getElementById('input_phone').style.border = '1px solid #a3a3a3'
				document.getElementById('input_phone_err').innerHTML =
					' '
				document.getElementById('input_password').style.border = '1px solid #a3a3a3'
				document.getElementById('input_password_err').innerHTML =
					' '
			}, 1000);

		},
		// login
		login() {
			if (this.validate_login()) {
				axios.post(`${URL_PUST_LOGIN}`, {
					users_name: this.formlogin.user,
					password: this.formlogin.password,
				}).then(function (response) {
					console.log(response);
					// console.log(response.data.token);
					if (response.data.status == 'ok') {
						//เข้าสู่ระบบได้
						console.log("data", response.data.user_id);
						if (response.data.token) {
							localStorage.setItem('acessToken', response.data.token)
							localStorage.setItem('users_id', response.data.user_id)
							window.location.replace(`/`);
						}


					}
					 if (response.data.status === 'error'||response.data.status === false) {
						document.getElementById('a-User').style.backgroundColor = 'red'
						document.getElementById('input_user_login').style.border = '3px solid red'
						document.getElementById('input_user_login').style.borderRadius = '0px 6px 6px 0'
						document.getElementById('input_user_login_err').innerHTML =
							'USER Login False'
						document.getElementById('a-password').style.backgroundColor = 'red'
						document.getElementById('input_password_login').style.border = '3px solid red'
						document.getElementById('input_password_login').style.borderRadius = '0px 6px 6px 0'
						document.getElementById('input_password_login_err').innerHTML =
							'USER Login False'
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: 'USER Login False',
							showConfirmButton: false,
							timer: 3500
						})
					} if (response.data.message === 'Login False') {
						//รหัสไม่ถูก
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: 'Login False',
							showConfirmButton: false,
							timer: 1500
						})
					}
				}).catch(function (error) {
					console.log(error);
				});

			}


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
					// console.log(response);
					if (response.data.status === "ok") {
						Swal.fire({
							position: "center",
							icon: "success",
							title: "สมัครสมาชิกสำเร็จ",
							showConfirmButton: false,
							timer: 1500
						}).then(() => {
							// window.location.replace(`/login0`);
							this.form.user = null,
								this.form.name = null,
								this.form.phone = null,
								this.form.password = null,
								this.form.user_status = 'user',
								this.Register_on = !this.Register_on
						});
					}
					if (response.data.status === "error") {
						alert("error");
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: 'Login False',
							showConfirmButton: false,
							timer: 1500
						})
					}
					if (response.data.status === "err") {
						alert("err");
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: 'Login False',
							showConfirmButton: false,
							timer: 1500
						})
					}
				}).catch(function (error) {
					console.log(error);
					Swal.fire({
						position: 'center',
						icon: 'error',
						title: 'Login False',
						showConfirmButton: false,
						timer: 1500
					})
				});
			}
		}
		// Register() {
		// 	if (this.validate_Register()) {
		// 		axios.post(`${URL_PUST_REGISTER}`, {
		// 			users_name: this.form.user,
		// 			name: this.form.name,
		// 			phone: this.form.phone,
		// 			password: this.form.password,
		// 			user_status: this.form.user_status,
		// 		}).then(
		// 			response => {
		// 				console.log(response);
		// 				if (response.data.status === 'ok') {
		// 					Swal.fire({
		// 						position: 'center',
		// 						icon: 'success',
		// 						title: 'สมัครสมาชิกสำเร็จ',
		// 						showConfirmButton: false,
		// 						timer: 1500
		// 					}).then(() => {
		// 						this.Register_on = !this.Register_on
		// 					})


		// 				} if (response.data.status === 'error') {
		// 					alert("error")
		// 				} if (response.data.status === 'err') {
		// 					alert("err")
		// 				}
		// 			}
		// 		).catch(function (error) {
		// 			console.log(error);
		// 		});
		// 	}

		// }
	},
	mounted() {
		setTimeout(() => {
			document.getElementById("input_user").style.border = "1px solid #a3a3a3";
			document.getElementById("input_name").style.border = "1px solid #a3a3a3";
			document.getElementById("input_phone").style.border = "1px solid #a3a3a3";
			document.getElementById("input_password").style.border = "1px solid #a3a3a3";
		}, 1000);

	},
	watch: {
		'form.user'() {
			if (this.form.user) {
				document.getElementById('input_user').style.border = '1px solid #a3a3a3'
				document.getElementById('input_user_err').innerHTML = ''
			} else {
				document.getElementById('input_user').style.border = '3px solid red'
				document.getElementById('input_user_err').innerHTML =
					'please enter user'
			}
		},
		'form.name'() {
			if (this.form.name) {
				document.getElementById('input_name').style.border = '1px solid #a3a3a3'
				document.getElementById('input_name_err').innerHTML = ''
			} else {
				document.getElementById('input_name').style.border = '3px solid red'
				document.getElementById('input_name_err').innerHTML =
					'please enter name'
			}
		},
		'form.phone'() {
			if (this.form.phone) {
				document.getElementById('input_phone').style.border = '1px solid #a3a3a3'
				document.getElementById('input_phone_err').innerHTML = ''
			} else {
				document.getElementById('input_phone').style.border = '3px solid red'
				document.getElementById('input_phone_err').innerHTML =
					'please enter phone'
			}
		},
		'form.password'() {
			if (this.form.password) {
				document.getElementById('input_password').style.border = '1px solid #a3a3a3'
				document.getElementById('input_password_err').innerHTML = ''
			} else {
				document.getElementById('input_password').style.border = '3px solid red'
				document.getElementById('input_password_err').innerHTML =
					'please enter password'
			}
		},
		'formlogin.user'() {
			if (this.formlogin.user) {
				document.getElementById('a-User').style.backgroundColor = ''
				document.getElementById('input_user_login').style.border = ''
				document.getElementById('input_user_login').style.borderRadius = '0px 6px 6px 0'
				document.getElementById('input_user_login_err').innerHTML =
					''
			} else {
				document.getElementById('a-User').style.backgroundColor = 'red'
				document.getElementById('input_user_login').style.border = '3px solid red'
				document.getElementById('input_user_login').style.borderRadius = '0px 6px 6px 0'
				document.getElementById('input_user_login_err').innerHTML =
					'please enter user'
			}
		},
		'formlogin.password'() {
			if (this.formlogin.password) {
				document.getElementById('a-password').style.backgroundColor = ''
				document.getElementById('input_password_login').style.border = ''
				document.getElementById('input_password_login').style.borderRadius = ''
				document.getElementById('input_password_login_err').innerHTML =
					''
			} else {
				document.getElementById('a-password').style.backgroundColor = 'red'
				document.getElementById('input_password_login').style.border = '3px solid red'
				document.getElementById('input_password_login').style.borderRadius = '0px 6px 6px 0'
				document.getElementById('input_password_login_err').innerHTML =
					'please enter password'
			}
		},
	}


}
</script>

<style>
* {
	color: rgb(0, 0, 0);
}

.div-login-main {
	color: rgb(0, 0, 0);
	display: flex;
	justify-content: center;
	font-family: 'Chakra Petch', sans-serif;
	align-items: center;
	height: 759px;
	background-color: rgb(255, 255, 255);

}

.card {
	width: 500px;
	height: 554px;
	/* transition: all 300ms; */
	display: flex;
	justify-content: center;
	align-items: center;
	row-gap: 21px;
	border-radius: 10px;
	background: #E9E9E9;
	box-shadow: -29px 29px 58px #8f8f8f,
		29px -29px 58px #ffffff;
	border: 1px solid rgb(0, 0, 0);
	transition: all .5s;
}

/* input User*/
.input-group {
	justify-content: center;
	display: flex;
	align-items: center;
	flex-wrap: nowrap;
}

.input,
.input-password {
	min-height: 50px;
	width: 355px;
	padding: 0 1rem;
	color: rgb(0, 0, 0);
	font-size: 15px;
	border: 1px solid rgb(0, 0, 0);
	border-radius: 0 6px 6px 0;
	background-color: transparent;
}

.input-password {
	max-width: 320px;
}

.input-div {
	display: flex;
	width: 355px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	row-gap: 30px;
}

.a-User {
	min-height: 50px;
	padding: .5em 1em;
	border: none;
	border-radius: 6px 0 0 6px;
	background-color: rgb(0, 0, 0);
	color: rgb(255, 255, 255);
	font-size: 15px;
	/* cursor: pointer; */
	transition: background-color .3s ease-in-out;
	display: flex;
	align-items: center;
}

.input:focus,
.input:focus-visible,
.input-password:focus,
.input-password:focus-visible {
	/* border-color: #3898EC; */
	outline: none;
}

/* end input User*/
/* button */
.card button {
	position: relative;
	display: inline-block;
	width: 50%;
	height: 8%;
	text-align: center;
	font-size: 18px;
	letter-spacing: 2px;
	text-decoration: none;
	color: rgb(0, 0, 0);
	background: transparent;
	cursor: pointer;
	transition: ease-out 0.5s;
	border: 1px solid rgb(0, 0, 0);
	border-radius: 10px;
	box-shadow: inset 0 0 0 0 rgb(0, 0, 0);
}

/* end button */
/* password_show */
.password_show {
	display: flex;
	width: 85%;
	align-items: center;
	column-gap: 10px;
	margin: -4px 6px 22px 75px;
}

li {
	list-style-type: none;
	color: rgb(0, 0, 0);
}

/* end password_show */

.btn {
	transition: none;
	height: auto;
}

.button-back {
	display: flex;
	position: absolute;
	margin: -583px 733px 0px 0px;
	background-color: rgb(230, 34, 77);
	border-radius: 5px;
	/* padding: 15px; */
	background-repeat: no-repeat;
	box-sizing: border-box;
	color: #fff;
	border: none;
	font-size: 12px;
	overflow: hidden;
	justify-content: center;
	align-items: center;
	width: 30px;
	height: 30px;

}

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
	width: 800px;
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
	width: 85%;
}

.register-div-button {
	display: flex;
	justify-content: center;
}

@media screen and (max-width: 900px) {
	.div-register-main {
		width: 100%;
	}

	.button-back {
		top: 58px;
		left: 15px;
		margin: 0;
	}

	@media screen and (max-width: 700px) {
		.div-register-main {
			width: 100%;
		}
	}
}

.err-msg-Register {
	color: red;
	font-size: 14px;
	margin-left: 8px;
	position: absolute;
}

.err-msg-login {
	color: red;
	font-size: 14px;
	width: 100%;
	position: absolute;
	margin: 75px 10px 10px 10px;
}
</style>