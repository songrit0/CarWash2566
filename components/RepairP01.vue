<template>
	<div class="div-receive-row">
		<h3>รอตอบรับ</h3>
		<div class="err_not_item" v-if="response?.length == 0 || response == null">
			<div class="item"> <img src="../img/error_FILL0_wght400_GRAD0_opsz48.svg" width="50%" alt="">
				<b>ยังไม่มีข้อมูล</b>
				<li>ยังไม่มีข้อมูลในการแจ้งซ่อมของผู้ใช้</li>
			</div>
		</div>
		<div class="col-3"  >
			<div class="input-group mb-3">
				<span class="input-group-text" style="height: 38px;" id="basic-addon1"><svg
						xmlns="http://www.w3.org/2000/svg" width="16" fill="currentColor" class="bi bi-search"
						viewBox="0 0 16 16">
						<path
							d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
					</svg></span>
				<input type="text" class="form-control" placeholder="ค้นหา" v-model="searching"
					@input="searchingEvent()">
			</div>
		</div>
		<div class="div-item1" v-if="response.length >= 1">

			<div class="item" v-for="item, index in response" :key="index">

				<div class="item1 col-3">

					<div class="div-img">

						<li v-if="item.equipment == ''">err null</li>
						<img v-if="item.equipment == 'คอมพิวเตอร์แม่ข่าย'"
							src="../img/computer_FILL0_wght400_GRAD0_opsz48.svg" alt="computer" width="40px">
						<img v-if="item.equipment == 'คอมพิวเตอร์ตั้งโต๊ะ(pc)'"
							src="../img/computer_FILL0_wght400_GRAD0_opsz48.svg" alt="computer" width="40px">
						<img v-if="item.equipment == 'คอมพิวเตอร์พกพา(NoteBook)'"
							src="../img/computer_FILL0_wght400_GRAD0_opsz48.svg" alt="computer" width="40px">
						<img v-if="item.equipment == 'เครื่องสแกนเนอร์(Scnner)'"
							src="../img/print_FILL0_wght400_GRAD0_opsz48.svg" alt="print" width="40px">
						<img v-if="item.equipment == 'ครื่องพิมพ์(printer)'"
							src="../img/print_FILL0_wght400_GRAD0_opsz48.svg" alt="print" width="40px">
						<img v-if="item.equipment == 'แป้นพิมพ์(KeyBoard)'"
							src="../img/keyboard_FILL0_wght400_GRAD0_opsz48.svg" alt="keyboard" width="40px">
						<img v-if="item.equipment == 'เม้าส์usb(mouseusb)'"
							src="../img/mouse_FILL0_wght400_GRAD0_opsz48.svg" alt="mouse" width="40px">
						<img v-if="item.equipment == 'อินเทอร์เน็ต(Internet)'"
							src="../img/signal_wifi_statusbar_not_connected_FILL0_wght400_GRAD0_opsz48.svg"
							alt="internet" width="40px">
						<img v-if="item.equipment === 'อื่นๆ'"
							src="../img/other_admission_FILL0_wght400_GRAD0_opsz48.svg" alt="other" width="40px">
					</div>
					{{ item.requirements }}

				</div>
				<div class="item2 col">
					<li>ต้องการแจ้งซ่อม : {{ item.equipment }}</li>
					<li>ปัณหา : {{ item.problem_symptom }}</li>
					<li>เวลาที่แจ้ง : {{ settime(item.date_repair) }}</li>
					<li>ชื้อผู้แจ้งซ่อม : {{ item.name_sender }}</li>
					<li>เบอร์ติดต่อผู้แจ้งซ่อม : {{ item.phone }}</li>

				</div>
				<div class="" style="height: 30px;font-size: 15px;position: absolute;margin-block-start: 150px;"><button
						type="button" class="btn  btn-info"
						@click="$router.push({ namr: 'Preview_Print', path: '/Preview_Print', query: { id: item?.id_repair_i } })"><svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
							class="bi bi-printer" viewBox="0 0 16 16">
							<path d="M2.5 8a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1z" />
							<path
								d="M5 1a2 2 0 0 0-2 2v2H2a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h1v1a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2v-1h1a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2h-1V3a2 2 0 0 0-2-2H5zM4 3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v2H4V3zm1 5a2 2 0 0 0-2 2v1H2a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-1v-1a2 2 0 0 0-2-2H5zm7 2v3a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1z" />
						</svg> พิมพ์+</button>

					<button class="btn-info btn" @click="Showformitem(true, item.id_repair_i)"><svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
							class="bi bi-zoom-in" viewBox="0 0 16 16">
							<path fill-rule="evenodd"
								d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z" />
							<path
								d="M10.344 11.742c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1 6.538 6.538 0 0 1-1.398 1.4z" />
							<path fill-rule="evenodd"
								d="M6.5 3a.5.5 0 0 1 .5.5V6h2.5a.5.5 0 0 1 0 1H7v2.5a.5.5 0 0 1-1 0V7H3.5a.5.5 0 0 1 0-1H6V3.5a.5.5 0 0 1 .5-.5z" />
						</svg>ข้อมมูล</button> <button class="btn-danger btn"
						@click="button(item.id_repair_i, 'ยกเลิก')">ยกเลิก</button>
					<button class="btn-success btn" @click="button(item.id_repair_i, 'กำลังดำเนินการ')">ตอบรับ</button>
				</div>

			</div>


		</div><br>
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
import { URL_GET_ALL_REQ, URL_GET_REQ, URL_IP, URL_PUT_PROCESS } from '../constants'
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
			set_length: 0,
			staus: 'ทั้งหมด',

			get_lengthdata: {
				All: '',
				process01: '',
				process02: '',
				process03: '',
			}, searching: '',

		}
	},
	methods: {
		searchingEvent() {
			setTimeout(() => {
				this.GETdata01()
			}, 2500);
			
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
		async button(item, staus) {
			if (staus == 'ยกเลิก') {
				Swal.fire({
					title: 'คุณกำลังจะยกเลิก',
					text: "คุณต้องการยกเลิกหรือไม่",
					icon: 'warning',
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					cancelButtonText: 'NO',
					confirmButtonText: 'YES'
				}).then((result) => {
					if (result.isConfirmed) {
						axios.put(`${URL_PUT_PROCESS}/${item}`, {
							staus: staus
						}).then(
							response => {
								console.log(response);
								if (response.data.status === 'ok') {
									Swal.fire({
										position: 'center',
										icon: 'success',
										title: 'ยกเลิกเรียบร้อยแล้ว',
										showConfirmButton: false,
										timer: 2500
									}).then(() => {
										axios.get(`${URL_GET_REQ}/?search=${this.searching}&staus=รอตอบรับ&user_id=&page=${this.page}&limit=5`
											).then(response => {
												
											this.response = response.data.results
										})
										axios.get(`${URL_GET_ALL_REQ}/?staus=รอตอบรับ`).then(response => {
											this.get_lengthdata.process01 = response.data.lengthdata
											var sum = response.data.lengthdata / 10
											this.set_length = Math.ceil(sum)
										})
										axios.get(`${URL_GET_ALL_REQ}/?staus=กำลังดำเนินการ`).then(response => {
											this.get_lengthdata.process02 = response.data.lengthdata
										})
									})
								}
							}
						)
					}
				})
			} else {
				const { value: fruit } = await Swal.fire({
					title: 'ลงชื่อผู้ประสานงาน(ผู้รับแจ้งซ่อม)',
					input: 'text',
					inputValue: this.$store.state.newUSER.names,
					inputPlaceholder: 'กรอกชื่อผู้รับแจ้งซ่อม',
					showCancelButton: true,
					inputValidator: (value) => {
						return new Promise((resolve) => {
							if (value) {
								resolve()
							} else {
								resolve('กรอกชื่อผู้รับแจ้งซ่อม :)')
							}
						})
					}
				})
				if (fruit) {
					axios.put(`${URL_PUT_PROCESS}/${item}`, {
						staus: staus,
						name_responsible: fruit,
						date_receive: new Date()
					}).then(
						response => {
							console.log(response);
							if (response.data.status === 'ok') {
								Swal.fire({
									position: 'center',
									icon: 'success',
									title: 'บันทึกเรียบร้อยแล้ว',
									showConfirmButton: false,
									timer: 2500
								}).then(() => {
									axios.get(`${URL_GET_REQ}/?search=${this.searching}&staus=รอตอบรับ&user_id=&page=${this.page}&limit=5`).then(response => {
										this.response = response.data.results
									})
									axios.get(`${URL_GET_ALL_REQ}/?staus=รอตอบรับ`).then(response => {
										this.get_lengthdata.process01 = response.data.lengthdata
										var sum = response.data.lengthdata / 10
										this.set_length = Math.ceil(sum)
									})
									axios.get(`${URL_GET_ALL_REQ}/?staus=กำลังดำเนินการ`).then(response => {
										this.get_lengthdata.process02 = response.data.lengthdata
									})
								})
							}
						}
					)
				}

			}


		},
		// async button(item, staus) {

		// 	const { value: fruit } = await Swal.fire({
		// 		title: 'Select field validation',
		// 		input: 'select',
		// 		inputOptions: this.g,
		// 		inputPlaceholder: 'Select a fruit',
		// 		showCancelButton: true,
		// 		inputValidator: (value) => {
		// 			return new Promise((resolve) => {
		// 				if (value) {
		// 					resolve()
		// 				} else {
		// 					resolve('You need to select oranges :)')
		// 				}
		// 			})
		// 		}
		// 	})

		// 	if (fruit) {
		// 		Swal.fire(`You selected: ${fruit}`)
		// 	}
		// },
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
			this.GETdata01()

		},
		GETdata01() {
			axios.get(`${URL_GET_REQ}/?search=${this.searching}&staus=รอตอบรับ&user_id=&page=${this.page}&limit=5`).then(response => {
				this.response = response.data.results
			})
			axios.get(`${URL_GET_ALL_REQ}/?staus=รอตอบรับ`).then(response => {
				this.get_lengthdata.process01 = response.data.lengthdata
				var sum = response.data.lengthdata / 10
				this.set_length = Math.ceil(sum)
			})
		}, Showformitem(payload, payload2) {
			$nuxt.$store.commit('setShowformitem', payload)
			$nuxt.$store.commit('setShowformitem_id', payload2)
			// console.log('id2',payload2);
		},




	},
	mounted() {

		// เปิดเว็บทำงานเลย
		this.GETdata01()

		// เช็คทุกๆ10วิ
		setInterval(() => {
			// this.GETdata01()
			// axios.get(`${URL_GET_REQ}/?staus=รอตอบรับ&page=${this.page}&limit=10`).then(response => {
			// 	this.response = response.data.results
			// })
			// axios.get(`${URL_GET_ALL_REQ}/?staus=รอตอบรับ`).then(response => {
			// 	this.get_lengthdata.process01 = response.data.lengthdata
			// 	var sum = response.data.lengthdata / 10
			// 	this.set_length = Math.ceil(sum)
			// })
		}, 10000);
	},
	watch: {
		noclickRE() {
			this.GETdata01()

		},
		page() {
			axios.get(`${URL_GET_REQ}/?search=${this.searching}&staus=รอตอบรับ&user_id=&page=${this.page}&limit=5`).then(response => {
				this.response = response.data.results
				// console.log(this.Getlimit_information);
			})
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
	row-gap: 60px;
}



.div-receive-row .div-item1 {
	display: grid;
	padding: 20px;
	column-gap: 25px;
	row-gap: 60px;
	grid-template-columns: 1fr 1fr;
	padding-bottom: 60px;
}

.div-receive-row .div-item1 .item {
	width: auto;
	height: 150px;
	display: flex;
	background-color: #f7f7f7;
	flex-direction: row;
	border-radius: 4px;
	
}

.div-receive-row .div-item1 .item .item1 {
	display: grid;
	align-content: space-around;
	justify-items: center;
	height: 150px;

}

.div-receive-row .div-item1 .item .item2 {
	display: grid;
	align-content: space-between;
	/* justify-items: center; */
	margin: 0px 0px 0px 10px;
	align-content: space-around;
	width: auto;
	overflow: scroll hidden;
}

.item2::-webkit-scrollbar {
	height: 7px;
}

.item2::-webkit-scrollbar-track {
	background-color: #fca5a5;
	border-radius: 40px;
}

.item2::-webkit-scrollbar-thumb {
	background-color: #0fd8ac;
	border-radius: 30px;
}


.div-item1 .item1 .button1 {
	width: auto;
	height: auto;
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

.div-item1 .item1 .button2 {
	position: absolute;
	margin-top: 60px;
	width: 73px;
	font-size: 13px;
	height: 20px;
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

@media screen and (max-width: 850px) {
	.div-receive-row .div-item1 {
		grid-template-columns: 1fr;
		width: 100%;
		margin: 0px 0px 0px -45px;
	}


}

.div-staus {
	grid-template-columns: 1fr 1fr;

}
</style>