<template>
	<div class="div-receive-row">
		<h3>ซ่อมเสร็จ</h3>
		<div class="err_not_item" v-if="response.length == 0 || response == null">
			<div class="item"> <img src="../img/error_FILL0_wght400_GRAD0_opsz48.svg" width="50%" alt="">
				<b>ยังไม่มีข้อมูล</b>
				<li>ยังไม่มีข้อมูลในการแจ้งซ่อมของผู้ใช้</li>
			</div>
		</div>
		<div class="div-item2" v-if="response.length >= 1">
			<div class="col-3">
				<div class="input-group mb-3">
					<span class="input-group-text" style="height: 38px;" id="basic-addon1"><svg xmlns="http://www.w3.org/2000/svg" width="16"
							 fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							<path
								d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
						</svg></span>
					<input type="text" class="form-control" placeholder="ค้นหา" v-model="searching" @input="searchingEvent()">
				</div>
			</div>
			<table>
				<tr>
					<th style="width: 30px;">ID</th>
					<th style="width: 100px;">ปัณหา</th>
					<th style="width: 88px;">ต้องการแจ้งซ่อม</th>
					<th style="width: 80px;">ชื้อผู้แจ้งซ่อม</th>
					<th style="width: 70px;">วัน/เวลาที่แจ้ง</th>
					<th style="width: 70px;">วัน/เวลารับแจ้ง</th>
					<th style="width: 55px;">สถานะ</th>
					<th style="width: 65px;">button</th>
				</tr>

				<tr v-for="(item, idex) in response" :key="idex">
					<td>
						<li>{{ item.id_repair_i }}</li>
					</td>
					<td>
						<li>{{ item.problem_symptom }}</li>
					</td>
					<td>
						<li>{{ item.equipment }}</li>
					</td>
					<td>
						<li>{{ item.name_sender }}</li>

					</td>
					<td>
						<b>{{
						`${new Date(item.date_repair).getDate()} /
						${new Date(item.date_repair).getMonth() + 1} /
						${new Date(item.date_repair).getFullYear()}
						`
						}}<br>{{ settime(item.date_repair) }}
						</b>
					</td>
					<td>
						<b>{{
						`${new Date(item.date_repair).getDate()} /
						${new Date(item.date_repair).getMonth() + 1} /
						${new Date(item.date_repair).getFullYear()}
						`
						}}<br>{{ settime(item.date_repair) }}
						</b>
					</td>
					<td>
						<li>{{ item.staus }}</li>
					</td>
					<td>
						<button @click="Showformitem(true, item.id_repair_i)">ข้อมูลเพิ่มเติม</button><button	@click="$router.push({ namr: 'Preview_Print', path: '/Preview_Print', query: { id: item?.id_repair_i } })">พิมพ์+</button>
					</td>
				</tr>
			</table>
		</div>
		<br>
		<div class="Pagination-item" v-if="response.length >= 1">
			
			<label for="cars">หน้าที่ :</label>
			<button type="button" @click="onpot_pages_back()" class="btn btn-outline-primary">&laquo;</button>
			<select class="form-select" v-model="page">
				<option v-for="idex in set_length" :key="idex" :value="idex">{{ idex }}</option>
			</select>
			<button type="button" @click="onpot_pages_go()" class="btn btn-outline-primary">&raquo;</button>
		</div>
		<br>
		<div class="div-staus">
			<button type="button" class="btn btn-warning col-12 button-re " @click="clickRE()">
				<li>โหลดข้อมูล</li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
					class="bi bi-arrow-clockwise" viewBox="0 0 16 16">
					<path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z" />
					<path
						d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z" />
				</svg>
			</button>
		</div>

	</div>
</template>

<script>
import axios from 'axios'
import { URL_GET_ALL_REQ, URL_GET_REQ, URL_PUT_PROCESS } from '../constants'
import Swal from 'sweetalert2'
export default {
	props: {
		noclickRE: {
			required: true,
		},
	},
	data() {
		return {
			response: '',
			page: 1,
			set_length: 10,
			// staus: 'ซ่อมเสร็จ',
			get_lengthdata: {
				All: '',
				process01: '',
				process02: '',
				process03: '',
			},searching: '',
		}
	},
	methods: {
		searchingEvent(){
			this.GET03_u()
		},
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
		GET03_u() {
			axios.get(`${URL_GET_REQ}/?search=${this.searching}&staus=ซ่อมเสร็จ&user_id=${localStorage.users_id}&page=${this.page}&limit=5`).then(response => {
				this.response = response.data.results
				// console.log(response.data);
			})
		},
		GETgetset_length() {
			axios.get(`${URL_GET_ALL_REQ}/?staus=ซ่อมเสร็จ&user_id=${localStorage.users_id}`).then(response => {
				this.get_lengthdata.process01 = response.data.lengthdata
				var sum = response.data.lengthdata / 10
				this.set_length = Math.ceil(sum)

			})
		},
		clickRE() {
			let Toast = Swal.mixin({
				toast: true,
				position: 'top-end',
				showConfirmButton: false,
				timer: 1000,
				timerProgressBar: true,
				didOpen: (toast) => {
					toast.addEventListener('mouseenter', Swal.stopTimer)
					toast.addEventListener('mouseleave', Swal.resumeTimer)
				}
			})

			Toast.fire({
				icon: 'success',
				title: 'โหลดข้อมูลไหม่แล้ว',
				// text: "รายการข้อมูลผู้ใช้งานจะอยู่ด้านล่าง!",
			})
			this.GET03_u()
			this.GETgetset_length()
		}

	},
	mounted() {
		this.GET03_u()
		this.GETgetset_length()

	},
	watch: {
		noclickRE() {
			this.GET03_u()
			this.GETgetset_length()

		},
		page() {
			this.GET03_u()
		}
	}
}
</script>

<style>
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
	width: 85%;
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

.div-receive-row .div-item2 {
	display: grid;
	padding: 20px;
	column-gap: 25px;
	row-gap: 25px;
	grid-template-columns: 1fr
}

.div-receive-row .div-item2 .item {
	width: auto;
	height: 150px;
	display: flex;
	background-color: #ffd8be;
	flex-direction: row;
	border-radius: 4px;
}

.div-receive-row .div-item2 .item .item1 {
	display: grid;
	align-content: space-around;
	justify-items: center;
	height: 150px;

}

.div-receive-row .div-item2 .item .item2 {
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

.div-item2 table {
	width: 100%;
	border-spacing: 0;
	border-radius: 12px 12px 12px 12px;
	color: aliceblue;
	text-align: center;
	background-color: #0b1621;
	/* border-radius: 26px; */
	overflow: hidden;
}

.div-item2 table th {
	color: black;
	background-color: #a9ecbf;
	height: 60px;
	text-transform: uppercase;
	font-size: 17px;
}

.div-item2 table td {
	/* color: aliceblue; */
	background-color: #ffffffe1;
	height: 60px;
	font-size: 14px;
}


/* --------------------table-end------------------- */
@media screen and (max-width: 800px) {
	.div-item2 table th {
		font-size: 10px;
	}

	.div-item2 table td {

		font-size: 10px;
	}
	.div-item2 table {
		width: 660px;
	}
	.div-receive-row .div-item2 {
		grid-template-columns: 1fr;
		overflow: scroll hidden;
		width: auto;
	}

	.div-staus {
		grid-template-columns: 1fr 1fr;
	}
	@media screen and (max-width : 350px) {
		.div-receive-row .div-item2 {
		grid-template-columns: 1fr;
		overflow: scroll hidden;
		width: 300px;
	}
	}
}
</style>