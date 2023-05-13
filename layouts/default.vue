<template>
	<div class="">


		<nav class="menu-bar-layouts">
			<!-- <qriously v-if="QRon" value="Hello World!" :size="200" /> -->
			<div class="group-layouts" @click="$router.push({ path: '/', replace: true })">
				<!-- <img class="logo-img" src="~/~/img/LogoMain.png" alt="" width="50px"> -->
				<li class="item-layouts title-layouts" @click="setUSER()">ระบบจัดการร้าน 
					<!-- {{ getnewUSER }} -->
				</li><label>Car Care Service</label>


			</div>
			<div class="div-toggler" :style="set_state_on ? '' : 'left: -192px;'" v-if="$store.state?.newUSER?.user_status === 'admin'">
				<!-- <li>เปิดการแจ้งเตือน :</li> -->
				<div class="toggler">
					<button @click="goAdmin_P()" type="button" class="btn btn-warning">ไปหน้าจัดการระบบ สำหรับแอดมิน</button>
				</div>
				<div class="div-toggler_BTN" @click="set_state_on = !set_state_on" 
					:style="set_state ? 'background-color: rgb(77, 252, 156); color: #000000' : 'color:#fff'">
					
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#ffff" class="bi bi-sunglasses" viewBox="0 0 16 16">
							<path d="M3 5a2 2 0 0 0-2 2v.5H.5a.5.5 0 0 0 0 1H1V9a2 2 0 0 0 2 2h1a3 3 0 0 0 3-3 1 1 0 1 1 2 0 3 3 0 0 0 3 3h1a2 2 0 0 0 2-2v-.5h.5a.5.5 0 0 0 0-1H15V7a2 2 0 0 0-2-2h-2a2 2 0 0 0-1.888 1.338A1.99 1.99 0 0 0 8 6a1.99 1.99 0 0 0-1.112.338A2 2 0 0 0 5 5H3zm0 1h.941c.264 0 .348.356.112.474l-.457.228a2 2 0 0 0-.894.894l-.228.457C2.356 8.289 2 8.205 2 7.94V7a1 1 0 0 1 1-1z"/>
						  </svg>A
				</div>
			</div>
			<div class="group-layouts">

				<div class="item-MenuDropdown">

					<div class="box001"></div>
					<button @click="MenuDropdown = !MenuDropdown" class="Menu_item1"
						:class="MenuDropdown ? '' : 'Menu_off'">
						<b>Menu</b>
					</button>
					<div class="Menu_item2" :class="MenuDropdown ? '' : 'Menu_off2'">
						<div>
							<li class="p-1 "
								@click="$router.push({ name: 'Edit_User', path: '/Edit_User', query: { id: $store.state.newUSER.user_id } })">
								user</li>

						</div>
						<div>
							<li class="p-1 " @click="QRon = !QRon">QR</li>
						</div>
						<div class="">

						</div>
						<div>
							<li class="p-1 " @click="logout()">Log Out</li>
						</div>
					</div>
				</div>
				<div class="button-B" v-if="!getIndex == '1'">
					<button @click="$router.back(1)">
						<svg height="16" width="16" xmlns="http://www.w3.org/2000/svg" version="1.1"
							viewBox="0 0 1024 1024">
							<path
								d="M874.690416 495.52477c0 11.2973-9.168824 20.466124-20.466124 20.466124l-604.773963 0 188.083679 188.083679c7.992021 7.992021 7.992021 20.947078 0 28.939099-4.001127 3.990894-9.240455 5.996574-14.46955 5.996574-5.239328 0-10.478655-1.995447-14.479783-5.996574l-223.00912-223.00912c-3.837398-3.837398-5.996574-9.046027-5.996574-14.46955 0-5.433756 2.159176-10.632151 5.996574-14.46955l223.019353-223.029586c7.992021-7.992021 20.957311-7.992021 28.949332 0 7.992021 8.002254 7.992021 20.957311 0 28.949332l-188.073446 188.073446 604.753497 0C865.521592 475.058646 874.690416 484.217237 874.690416 495.52477z">
							</path>
						</svg>
						<span>Back</span>
					</button>
				</div>

				<div class="QR-mian" v-if="QRon">
					<div class="qriously">
						<button @click="QRon = !QRon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="#ffff" class="bi bi-x" viewBox="0 0 16 16">
								<path
									d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
							</svg></button>
						<qriously class="qriously-item" :value="URL" :size="200" />
						<br>
						<div class="row"><input type="text" v-model="URL" class="form-control col-9"></div>
						<div class="row center">
							URL สำหรับแชร์
							<br>
							{{ URL }}
						</div>
					</div>

				</div>
			</div>
		</nav>
		<Nuxt />
	
	</div>

</template>
<script>

import axios from 'axios';
import { URL_GET_ALL_REQ, URL_GET_REQ, URL_GET_USER, URL_IP } from "../constants"
import Swal from 'sweetalert2';

export default ({

	data() {
		return {
			MenuDropdown: false,
			get_acessTokens: false,
			getIndex: '',
			statusON: 'x',
			QRon: false,
			URL: '',
			set_state: false,
			set_state_on: false
		}
	}, computed: {
		mode() {
			return this.$store.state.counter
		},
		getnewUSER() {
			return this.$store.state.newUSER
		}
	},
	methods: {
		goAdmin_P(){
			window.location.replace(`/Admin`);
		},
		submitSearch() {
			localStorage.setItem('acessToken', 'AA')
		},
		logout() {
			localStorage.removeItem('acessToken')
			localStorage.removeItem('users_id')
			this.$store.commit('steUSER', null)
			window.location.replace(`/login0`)
		},
		increment() {
			this.$store.commit('increment')
		},
		setUSER() {
			var id = localStorage.users_id
			axios.get(`${URL_GET_USER}/${id}`).then(response => {
				this.$store.commit('steUSER', response.data.results[0])
				// console.log('home:',response.data.results[0]);
			});
		},

		checkAlert() {

			// var USER_STAUS = this.$store.state?.newUSER?.user_status
			// if (USER_STAUS === 'admin') {
			// 	var audio = new Audio();
			// 	audio.src = "http://commondatastorage.googleapis.com/codeskulptor-assets/Collision8-Bit.ogg";
			// 	// audio.src = "https://media1.vocaroo.com/mp3/17RnRCYXCMRN";
			// 	audio.play();
			// 	const Toast = Swal.mixin({
			// 		toast: true,
			// 		position: 'top-end',
			// 		showConfirmButton: false,
			// 		timer: 10000,
			// 		timerProgressBar: true,
			// 		didOpen: (toast) => {
			// 			toast.addEventListener('mouseenter', Swal.stopTimer)
			// 			toast.addEventListener('mouseleave', Swal.resumeTimer)
			// 		}
			// 	})
			// 	Toast.fire({
			// 		icon: 'warning',
			// 		title: `มีการแจ้งซ่อม `,
			// 		text: `จำนวน ${this.$store.state.statusON.lengthdata} การแจ้งซ่อม`,
			// 	})

			// }


		},
		get_state() {
			axios.get(`${URL_IP}/state/?staus=รอตอบรับ`).then(response => {
				var status = response.data
				this.$store.commit('setstatusON', status)
				// console.log('status "รอตอบรับ":', status);
				// console.log(1);
			})
		},
		get_login(){
			
		}


	},
	mounted() {
		this.setUSER()
		this.get_state()
		this.get_login()
		setInterval(() => {
			this.getIndex = this.$route.query.Index
			
		
		}, 1000);
		setInterval(() => {
			this.get_state()
		}, 60000);

		setInterval(() => {
			if (this.set_state) {
				this.get_state()
			}
			// console.log(2);

			
		}, 10000);


		setInterval(() => {
			var gat = localStorage.getItem('acessToken')

			if (gat) {
				this.get_acessTokens = true
			} else {
				this.get_acessTokens = false
			}

			if (this.get_acessTokens) {
				// console.log(this.get_acessTokens);
				if (this.$router.currentRoute.path === '/login0') {
					// console.log("no1");
					// console.log("yes1");
					window.location.replace(`/`)
				} else {
					// console.log("no2");
					// console.log("yes2");
				}
			} else {
				// window.location.replace(`/login0`)
				if (this.$router.currentRoute.path === '/login0') {
					// console.log("no1");
				} else {
					// console.log("no2");
					window.location.replace(`/login0`)
				}
				
				// console.log(this.$route.query.page);
				console.log();
			}

		}, 1000);
		this.URL = window.origin
	},

	watch: {
		"$store.state.statusON.lengthdata"() {
			if (this.$store.state.statusON.lengthdata == 0) {

			} else {
				this.checkAlert()
			}

		},
		get_acessToken() {
			if (!this.get_acessTokens) {
				this.$router.push('/login0');
			} else {

			}
		}
	},
	
})
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Chakra+Petch&display=swap');

* {
	font-family: 'Chakra Petch', sans-serif;
}

br {
	width: 50px;
}

.QR-mian {
	position: absolute;
	display: grid;
	top: 0;
	right: 0;
	width: 100%;
	height: 100%;
	justify-items: center;
	align-items: center;
	z-index: 10;
	backdrop-filter: blur(2px);

}

.qriously {
	display: flex;
	width: 400px;
	height: 450px;
	background-color: #dedede;
	flex-direction: column;
	align-items: center;
	border-radius: 5px;
}

.qriously-item {
	display: flex;
	width: 55%;
	height: 50%;
	margin-top: 15px;
	background-color: #dedede;
	border: 5px solid #000000;
	border-radius: 5px;
}

.qriously button {
	background-color: #dc3545;
	border: none;
	width: 30px;
	height: 30px;
	display: grid;
	border-radius: 55px;
	align-items: center;
	position: initial;
	justify-content: center;
	margin-top: 1%;
	margin-right: 89%;
}

.menu-bar-layouts {
	background-color: #144272;
	display: flex;
	justify-content: space-between;
	box-sizing: border-box;
	z-index: 2;
}

.item-layouts {
	color: white;
	background-color: transparent;
	font-size: 25px;
	display: inline-block;
	box-sizing: border-box;
	padding: 14px 20px;
}

.group-layouts label {
	color: rgba(255, 255, 255, 0.49);
	margin-left: -160px;
	margin-top: 40px;
	position: absolute;
	font-size: 13px;
}

.logo-img {
	display: inline-flex;
	margin: 0px 0px 5px 20px;
}

.item-layouts.title-layouts {
	font-weight: 10;
}

/* .item-layouts:hover {
	background-color: rgba(0, 0, 0, 0.1);
} */

/* -maiu */

.item-MenuDropdown {
	color: white;
	font-size: 18px;
	display: flex;
	width: 170px;
	height: auto;
	/* border: 2px solid #ff0000; */
	flex-direction: column;
	align-items: center;
	position: relative;
	top: 17px;

}

.Menu_item1 {
	font-size: 16px;
	display: flex;
	/* top: 21px; */
	color: rgb(255, 255, 255);
	width: 100px;
	height: 40px;
	background-color: #2C74B3;
	align-items: center;
	justify-content: center;
	border-radius: 12px 12px 0px 0px;
	/* box-shadow: rgb(40 73 106) -5px 5px 0px 0px; */
	transition: all .3s ease;
	z-index: 2;
	border: none
}

.Menu_item1:hover {
	box-shadow: #1e4e77 0px 0px 0px 0px
}

.Menu_off {
	border-radius: 8px;
	/* box-shadow: #1e4e77 -5px 5px 0px 0px */
}

.Menu_item2 {
	display: flex;
	color: rgb(255, 255, 255);
	width: 100px;
	height: auto;
	background-color: #2C74B3;
	justify-content: center;
	position: absolute;
	margin: 40px;
	flex-direction: column;
	align-items: flex-start;
	padding: 5px 0px 5px 15px;
	border-radius: 0px 0px 12px 12px;
	transition: all .3s ease;
	top: 0px;
	z-index: 1;

}

.Menu_off2 {
	top: -120px;
	transition: all .3s ease;
}

.Menu_item2 li {
	color: #ffffff;
	font-size: 13px;
	width: 100%;
	cursor: pointer;

}

.Menu_item2 div {
	width: 80%;
	border-radius: 5px;
	/* padding: 0px 0px 0px 15px; */
	/* background-color: #133557; */
}

.Menu_item2 div:hover {
	background-color: #133557;
}

.box001 {
	display: flex;
	position: absolute;
	width: 100px;
	height: 40px;
	background-color: #144272;
	margin-top: -20px;
	z-index: 2;
}

/* end -maiu */
.button-B {
	display: flex;
	position: absolute;
	top: 80px;
	right: 40px;
	z-index: 0;
	transform: scale(0.8, 0.8);
}

.button-B button {
	display: flex;
	height: 3em;
	width: 100px;
	align-items: center;
	justify-content: center;
	background-color: #eeeeee4b;
	border-radius: 3px;
	letter-spacing: 1px;
	transition: all 0.2s linear;
	cursor: pointer;
	border: none;
	background: #fff;
	border: 2px solid #000000;
}

.button-B button>svg {
	margin-right: 5px;
	margin-left: 5px;
	font-size: 20px;
	transition: all 0.4s ease-in;
}

.button-B button:hover>svg {
	font-size: 1.2em;
	transform: translateX(-5px);
}

.button-B button:hover {
	/* box-shadow: 9px 9px 33px #d1d1d1, -9px -9px 33px #ffffff; */
	transform: translateY(-2px);

}

.err_not_item {
	display: grid;
	justify-content: center;
	align-items: center;
	align-content: center;
	/* background-color: red; */
}

.err_not_item .item {
	background-color: #ff00004d;
	width: 200px;
	height: 200px;
	display: flex;
	align-items: center;
	align-content: center;
	flex-direction: column;
	border-radius: 5px;
	text-align: -webkit-center;
}

body::-webkit-scrollbar {
	width: 15px;
	/* background-color: #cecece7b; */

}

body::-webkit-scrollbar-button {
	display: block;
	background-color: #b91c1c;
	background-repeat: no-repeat;
	background-size: 50%;
	background-position: center;
}

body::-webkit-scrollbar-button:vertical:start:increment {
	background-image: url('https://upload.wikimedia.org/wikipedia/commons/7/7e/Chevron-up.svg');
	border-radius: 0px 0px 5px 5px;
	height: 20px;
}

body::-webkit-scrollbar-button:vertical:start:decrement {
	display: none;
}

body::-webkit-scrollbar-button:vertical:end:increment {
	display: none;
}

body::-webkit-scrollbar-button:vertical:end:decrement {
	background-image: url('https://upload.wikimedia.org/wikipedia/commons/e/ee/Chevron-down.svg');
	border-radius: 5px 5px 0px 0px;
	height: 20px;
}

body::-webkit-scrollbar-button {
	background-color: #ff7300c9;

}

body::-webkit-scrollbar-track {
	/* background-color: #cecece7b; */
	position: absolute;
}

body::-webkit-scrollbar-thumb {
	background-color: #0062ff67;
	border-radius: 12px;
}



.div-toggler {
	display: flex;
	background-color: rgb(255 193 7);
	width: 210px;
	height: 45px;
	position: absolute;
	top: 71px;
	border-radius: 0px 10px 10px 0px;
	align-items: center;
	justify-content: center;
	left: 0px;
	transition: all .2s linear;
}

.div-toggler_BTN {
	display: flex;
    background-color: rgb(252, 77, 77);
    width: 40px;
    height: 45px;
    margin-right: -214px;
    position: absolute;
    border-radius: 0px 10px 10px 0px;
    align-items: center;
    justify-content: center;
	column-gap: 3px;

}

.toggler {
	width: 100%;
	transform: scale(0.9, 0.7);
	/* margin: 40px auto; */
}

.toggler input {
	display: none;
}

.toggler label {
	display: block;
	position: relative;
	width: 72px;
	height: 36px;
	border: 1px solid #d6d6d6;
	border-radius: 36px;
	background: #e4e8e8;
	cursor: pointer;
}

.toggler label::after {
	display: block;
	border-radius: 100%;
	background-color: #d7062a;
	content: '';
	animation-name: toggler-size;
	animation-duration: 0.15s;
	animation-timing-function: ease-out;
	animation-direction: forwards;
	animation-iteration-count: 1;
	animation-play-state: running;
}

.toggler label::after,
.toggler label .toggler-on,
.toggler label .toggler-off {
	position: absolute;
	top: 50%;
	left: 25%;
	width: 26px;
	height: 26px;
	transform: translateY(-50%) translateX(-50%);
	transition: left 0.15s ease-in-out, background-color 0.2s ease-out, width 0.15s ease-in-out, height 0.15s ease-in-out, opacity 0.15s ease-in-out;
}

.toggler input:checked+label::after,
.toggler input:checked+label .toggler-on,
.toggler input:checked+label .toggler-off {
	left: 75%;
}

.toggler input:checked+label::after {
	background-color: #50ac5d;
	animation-name: toggler-size2;
}

.toggler .toggler-on,
.toggler .toggler-off {
	opacity: 1;
	z-index: 2;
}

.toggler input:checked+label .toggler-off,
.toggler input:not(:checked)+label .toggler-on {
	width: 0;
	height: 0;
	opacity: 0;
}

.toggler .path {
	fill: none;
	stroke: #fefefe;
	stroke-width: 7px;
	stroke-linecap: round;
	stroke-miterlimit: 10;
}

@keyframes toggler-size {

	0%,
	100% {
		width: 26px;
		height: 26px;
	}

	50% {
		width: 20px;
		height: 20px;
	}
}

@keyframes toggler-size2 {

	0%,
	100% {
		width: 26px;
		height: 26px;
	}

	50% {
		width: 20px;
		height: 20px;
	}
}
</style>