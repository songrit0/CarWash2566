<template>
	<div class="div-receive-row">
		<br>
		<br>
		<h3 class="3h">จัดการ USERS</h3>

		<!-- <div class="delete-button">
			<button @click="delete_all()">delete-button</button></div> -->

		<div class="err_not_item" v-if="response?.length == 0 || response == null">
			<div class="item"> <img src="../img/error_FILL0_wght400_GRAD0_opsz48.svg" width="50%" alt="">
				<b>ยังไม่มีข้อมูล</b>

			</div>
		</div>
		<div class="div-item0">
			<table>
				<tr>
					<th style="width: 30px;">user_id</th>
					<th style="width: 100px;">users_name</th>
					<th style="width: 88px;">user_status</th>
					<th style="width: 80px;">names</th>
					<th style="width: 55px;">phone</th>
					<th style="width: 65px;">จัดการเพิ่มเติม</th>
				</tr>

				<tr v-for="(item, idex) in response" :key="idex">
					<td>
						<li>{{ item.user_id }}</li>
					</td>
					<td>
						<li>{{ item.users_name }}</li>
					</td>
					<td>
						<li>{{ item.user_status }} <a v-if="item.user_status == 'admin'">🔴</a><a v-if="item.user_status == 'user'">🟢</a></li>
					</td>
					<td>
						<li>{{ item.names }}</li>
					</td>
					<td>
						<li>{{ item.phone }}</li>
					</td>
					<td>
						<div class="button-abot">
							<button class="button-edit-1"
								@click="$router.push({ name: 'Edit_User', path: '/Edit_User', query: { id: item.user_id } })">แก้ไข
							</button>
							<button class="button-edit-2" @click="deleteinfrmation(item.user_id)">ลบข้อมูล </button>

						</div>
					</td>
				</tr>
			</table>

		</div>

		<!-- <div class="Pagination-item">
			<label for="cars">หน้าที่ :</label>
			<button type="button" @click="onpot_pages_back()" class="btn btn-outline-primary">&laquo;</button>
			<select class="form-select" v-model="page">
				<option v-for="idex in set_length" :key="idex" :value="idex">{{ idex }}</option>
			</select>
			<button type="button" @click="onpot_pages_go()" class="btn btn-outline-primary">&raquo;</button>
		</div> -->

	</div>
</template>

<script>
import axios from 'axios'
import { URL_GET_ALL_REQ, URL_GET_REQ, URL_GET__INFORMATION, URL_DELETE_USER_ALL, URL_DELETE_USER, URL_GET_USERS } from '../constants'
import Swal from 'sweetalert2'
export default {
	data() {
		return {
			response: '',
			page: 1,
			set_length: 10,
			// staus: 'ทั้งหมด',
			get_lengthdata: {
				All: '',
				process01: '',
				process02: '',
				process03: '',
			}
		}
	},
	methods: {
		Showformitem(payload, payload2) {
			$nuxt.$store.commit('setShowformitem', payload)
			$nuxt.$store.commit('setShowformitem_id', payload2)
			// console.log('id2',payload2);
		},
		onpot_pages_go() {
			if (this.page === this.set_length) {

			} else {
				this.page = this.page + 1
			}

		},
		onpot_pages_back() {
			if (this.page === 1) {

			} else {
				this.page = this.page - 1
			}
		},
		settime(item) {
			var H = new Date(item).getHours()
			var M = new Date(item).getMinutes()
			return `${H}:${M} น.`
		},

		GET00_u() {
			axios.get(`${URL_GET_USERS}/?staus=ทั้งหมด&page=${this.page}&limit=10`).then(response => {
				this.response = response.data.results
			})
		},
		GETset_length() {
			axios.get(`${URL_GET_USERS}/?staus=ทั้งหมด&user_id=${localStorage.users_id}`).then(response => {
				this.response = response.data.results
			})
		},

		deleteinfrmation(item) {
			axios.delete(`${URL_DELETE_USER}/${item}`).then(() => {
				this.GETset_length()
				this.GET00_u()
				Swal.fire({
					position: 'center',
					icon: 'success',
					title: 'ลบข้อมูลเรียบร้อย',
					showConfirmButton: false,
					timer: 1500
				})
			});
		},

		delete_all() {
			axios.delete(`${URL_DELETE_USER_ALL}`).then(() => {
				Swal.fire({
					position: 'center',
					icon: 'success',
					title: 'ลบข้อมูลเรียบร้อย',
					showConfirmButton: false,
					timer: 1500
				})
			});
		}

	},
	mounted() {
		// เปิดเว็บทำงานเลย
		this.GET00_u()
		this.GETset_length()

		// เช็คทุกๆ10วิ
		setInterval(() => {
			this.GET00_u()
			this.GETset_length()
		}, 10000);
	},
	watch: {

		page() {
			this.GET00_u()
			this.GETset_length()
		}
	}
}
</script>

<style>
.delete-button {
	/* border: solid red 1px; */
	margin-left: 35px;
}

.button-abot {
	/* border:solid red 2px ; */
	display: flex;
	justify-content: center;
}

.button-edit-1 {
	border: none;
	color: rgb(227, 220, 3);
}

.button-edit-2 {
	border: none;
	color: rgb(244, 0, 0);
}

.div-receive {
	display: flex;
	flex-direction: column;
	flex-wrap: nowrap;
	justify-content: flex-start;
	align-items: center;
	margin-top: 40px;
	z-index: 1;
}

.div-receive-pages {
	display: flex;
	flex-direction: column;
	width: 95%;
	align-items: center;
}

.div-receive-row {
	display: flex;
	width: 100%;
	padding: 15px;
	grid-template-columns: 1fr;
	/* border: 2px solid #ff0000; */
	flex-direction: column;
	flex-wrap: nowrap;
}


.item-staus {
	border-radius: 10px;
	width: 145px;
	height: 100px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	/* background: #c7c7ff; */

}

.div-staus {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr;
	justify-items: stretch;
	align-items: stretch;
	column-gap: 27px;
	row-gap: 27px;
}

.div-receive-row .div-item0 {
	display: grid;
	padding: 20px;
	column-gap: 25px;
	row-gap: 25px;
	grid-template-columns: 1fr
}

.div-receive-row .div-item0 .item {
	width: auto;
	height: 150px;
	display: flex;
	background-color: #ffd8be;
	flex-direction: row;
	border-radius: 4px;
}

.div-receive-row .div-item0 .item .item1 {
	display: grid;
	align-content: space-around;
	justify-items: center;
	height: 150px;

}

.div-receive-row .div-item0 .item .item2 {
	display: grid;
	align-content: space-between;
	/* justify-items: center; */
	margin: 0px 0px 0px 10px;
	align-content: space-around;

}



.item1 button {
	width: 80px;
	height: 34px;
	cursor: pointer;
	display: flex;
	align-items: center;
	/* background: red; */
	border: none;
	margin: auto;
	border-radius: 5px;
	/* box-shadow: 1px 1px 3px rgb(0 0 0 / 15%); */
	/* background: #a9ecbf; */
	justify-content: center;
}


.Pagination-item {
	display: flex;
	justify-content: flex-start;
	flex-wrap: nowrap;
	flex-direction: row;
	align-items: center;
}

.Pagination-item label {
	width: 100px;
}

.Pagination-item select {
	width: 120px;
}

/* --------------------table-------------------- */

.div-item0 table {
	width: 100%;
	border-spacing: 0;
	border-radius: 12px 12px 12px 12px;
	color: aliceblue;
	text-align: center;
	background-color: #0b1621;
	/* border-radius: 26px; */
	overflow: hidden;
}

.div-item0 table th {
	color: black;
	background-color: #c7c7ff;
	height: 60px;
	text-transform: uppercase;
	font-size: 17px;
}

.div-item0 table td {
	/* color: aliceblue; */
	background-color: #ffffffe1;
	height: 60px;
	font-size: 14px;
}


/* --------------------table-end------------------- */
@media screen and (max-width: 800px) {
	.div-item0 table th {
		font-size: 10px;
	}

	.div-item0 table td {

		font-size: 10px;
	}

	.div-receive-row .div-item0 {
		grid-template-columns: 1fr;
	}

	.div-staus {
		grid-template-columns: 1fr 1fr;
	}
}
</style>