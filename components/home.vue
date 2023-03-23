<template>
	<div class="div-home">
		<div class="div-home-pages">
			<h1>ระบบแจ้งซ่อม</h1>
			<div class="div-home-row">
				<div class="item p-3 back-img-register background-img-Repair " @click="$router.push(`/RepairNew`)">
					<h4>แจ้งซ่อม</h4>
					Repair
				</div>
				<div v-if="$store.state.newUSER?.user_status === 'admin'" class="item p-3 back-img-register background-img-Notification" @click="$router.push(`/Receive_Repair`)">
					<h4>รับ แจ้งซ่อม</h4>
					Repair Notification
				</div>
			</div>
			<br>
			<h1  v-if="$store.state.newUSER?.user_status === 'admin'" >ระบบ User</h1>
			<div  v-if="$store.state.newUSER?.user_status === 'admin'"  class="div-home-row-User">
				<div class="item-User p-3 back-img-register background-img-register" @click="$router.push(`/Register`)">
					<h4>สมัครสมาชิก</h4>
					register

				</div>
				<div class="item-User p-3 back-img-register background-img-user" @click="$router.push(`/User_List`)">
					<h4>ผู้ใช้งาน</h4>
					User
				</div>

				<div class="item-User p-3 back-img-register background-img-I" @click="$router.push(`/showCRUD`)">
					<h4>จัดการข้อมูลเพิ่มเติม</h4>
					manage additional information
				</div>

				
				<div class="item-User p-3 back-img-register background-img-I2" @click="$router.push(`/Manage`)">
					<h4>จัดการข้อมูลเจ้าหน้าที่ประสานงาน</h4>
					Manage coordinator information
				</div>

			</div>
		</div>
	</div>
</template>

<script>
export default {
	data() {
		return {
			get: '_',
			USER_STAUS : this.$store.state.newUSER?.user_status
		}
	},
	methods: {
		
	},
	mounted() {
	},
	watch: {
	}
}
</script>

<style>
.div-home {
	display: flex;
	flex-direction: column;
	flex-wrap: nowrap;
	justify-content: flex-start;
	align-items: center;
	margin-top: 40px;
	z-index: 1;
}

.div-home-pages {
	display: flex;
	flex-direction: column;
	width: 95%;
}

.div-home-row {
	display: grid;
	grid-column-gap: 20px;
	column-gap: 20px;
	grid-row-gap: 20px;
	row-gap: 20px;
	grid-template-columns: 1fr 1fr;
}

.div-home-row .item {
	width: 100%;
	height: 185px;
	border-radius: 12px;
}

.div-home-row-User {
	display: grid;
	grid-column-gap: 20px;
	column-gap: 20px;
	grid-row-gap: 20px;
	row-gap: 20px;
	grid-template-columns: 1fr 1fr 1fr 1fr;
}

.div-home-row-User .item-User {
	width: 100%;
	height: 185px;
	border-radius: 12px;
}

.div-home-main {
	display: flex;
	flex-direction: column;
	flex-wrap: nowrap;
	justify-content: flex-start;
	/* background-color: #2D3142; */
	width: 75%;
	min-height: 500px;
	align-items: center;
	border-radius: 10px;
	background: linear-gradient(225deg, #f0f0f0, #cacaca);
	box-shadow: -29px 29px 58px #8f8f8f,
		29px -29px 10px #ffffff;
}

.div-menu {
	/* border: 2px solid #ff0000; */
	display: flex;
	width: 100%;
	height: 100%;
	flex-direction: row;
	padding: 0px 260px 0px 260px;
	grid-column-gap: 20px;
	column-gap: 20px;
	grid-row-gap: 18px;
	row-gap: 20px;
	flex-wrap: wrap;
	justify-content: center;
	align-content: flex-start;
}

.container {
	width: 80%;
}

.menu-item {
	display: flex;
	flex-direction: column;
	flex-wrap: nowrap;
	align-items: center;
	height: 110px;
	border-radius: 12px;
}



.back-img-register:hover {
	background-color: #8888ad6c;
	transition: all .3s ease;
	transform: scale(1.05, 1.05);
	cursor: pointer;
}

.background-img-user {
	background: url(~/img/how_to_reg_FILL0_wght400_GRAD0_opsz48.svg);
	background-repeat: no-repeat;
	background-position: bottom right;
	background-size: 60px;
	background-color: #C7C7FF;
}
.background-img-I {
	background: url(~/img/database.svg);
	background-repeat: no-repeat;
	background-position: bottom right;
	background-size: 60px;
	background-color: #C7C7FF;
}
.background-img-I2 {
	background: url(~/img/clipboard-minus.svg);
	background-repeat: no-repeat;
	background-position: bottom right;
	background-size: 60px;
	background-color: #C7C7FF;
}
.background-img-register {
	background: url(~/img/app_registration_FILL0_wght400_GRAD0_opsz48.svg);
	background-repeat: no-repeat;
	background-position: bottom right;
	background-size: 60px;
	background-color: #C7C7FF;
}
.background-img-Repair {
	background: url(~/img/construction_FILL0_wght400_GRAD0_opsz48.svg);
	background-repeat: no-repeat;
	background-position: bottom right;
	background-size: 60px;
	background-color: #C7C7FF;
}
.background-img-Notification {
	background: url(~/img/home_repair_service_FILL0_wght400_GRAD0_opsz48.svg);
	background-repeat: no-repeat;
	background-position: bottom right;
	background-size: 60px;
	background-color: #C7C7FF;
}
@media screen and (max-width: 900px) {
	.div-home-main {
		width: 90%;
	}

	@media screen and (max-width: 700px) {
		.div-home-row-User {
			grid-template-columns: 1fr 1fr 1fr;
		}

		@media screen and (max-width: 500px) {
			.div-home-row-User {
				grid-template-columns: 1fr 1fr;
			}

			.div-home-row {
				grid-template-columns: 1fr;
			}
		}
	}
}
</style>