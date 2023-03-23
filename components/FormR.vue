<template>
	<div class="FormR-home" v-if="getformon">
		<br>
		<div class="row mb-3">
			<label for="inputEmail3" class="col-sm-2 col-form-label">ชื่อผู้ส่งแจ้งซ่อม </label>
			<div class="col-sm-10">
				<input v-model="form.responsible_person" type="text" class="form-control"
					placeholder="กรอก ชื่อผู้ส่งแจ้งซ่อม">
			</div>
		</div>
		<div class="row mb-3">
			<label for="inputEmail3" class="col-sm-2 col-form-label">กลุ่มงาน</label>
			<div class="col-sm-10">
				<input v-model="form.work_group" type="text" class="form-control"
					placeholder="กรอก ชื่อหรือข้อมูล กลุ่มงาน">

			</div>
		</div>
		<div class="row mb-3">
			<label for="inputEmail3" class="col-sm-2 col-form-label">งาน</label>
			<div class="col-sm-10">
				<input v-model="form.work" type="text" class="form-control" placeholder="กรอก ชื่อหรือข้อมูล ฝ่ายงาน">
			</div>
		</div>
		<div class="row mb-3">
			<label for="inputEmail3" class="col-sm-2 col-form-label">เบอร์โทรศัพท์</label>
			<div class="col-sm-10">
				<input v-model="form.phone" type="text" class="form-control" placeholder="กรอก เบอร์โทรศัพท์ติดต่อ">
			</div>
		</div>
		<div class="row mb-3">
			<legend class="col-form-label col-sm-2 pt-0">ต้องการแจ้งซ่อม</legend>
			<div class="col-sm-10 ">
				<select class="form-select" v-model="form.equipment">
					<option value="" disabled>เลือก การแจ้งซ่อม</option>
					<option v-for="item in report" :key="item" :value="item">{{ item }}</option>
				</select>
			</div>
		</div>
		<div class="row mb-3"
			v-if="form.equipment === 'คอมพิวเตอร์แม่ข่าย' || form.equipment === 'คอมพิวเตอร์ตั้งโต๊ะ(pc)' || form.equipment === 'คอมพิวเตอร์พกพา(NoteBook)' || form.equipment === 'เครื่องสแกนเนอร์(Scnner)' || form.equipment === 'ครื่องพิมพ์(printer)'">
			<label for="inputEmail3" class="col-sm-2 col-form-label">ชื่อ คอมพิวเตอร์/อุปกรณ์</label>
			<div class="col-sm-10">
				<input v-model="form.computer_name" type="text" class="form-control"
					placeholder="กรอก ชื่อคอมพิวเตอร์หรือชื่อรุ่นคอมพิวเตอร์หรือชื่อรุ่นอุปกรณ์(ถ้ามี)">

			</div>
		</div>
		<div class="row mb-3">
			<label for="inputEmail3" class="col-sm-2 col-form-label">รหัสครุภัณฑ์</label>
			<div class="col-sm-10">
				<input v-model="form.commodity_code" type="text" class="form-control"
					placeholder="กรอก รหัสครุภัณฑ์ (ถ้ามี)">

			</div>
		</div>
		<div class="row mb-3"
			v-if="form.equipment === 'คอมพิวเตอร์แม่ข่าย' || form.equipment === 'คอมพิวเตอร์ตั้งโต๊ะ(pc)' || form.equipment === 'คอมพิวเตอร์พกพา(NoteBook)' || form.equipment === 'เครื่องสแกนเนอร์(Scnner)' || form.equipment === 'ครื่องพิมพ์(printer)'">
			<label for="inputEmail3" class="col-sm-2 col-form-label">ip_address</label>
			<div class="col-sm-10">
				<input v-model="form.ip_address" type="text" class="form-control" placeholder="กรอก ip_address (ถ้ามี)">

			</div>
		</div>
		<div class="row mb-3" v-if="form.equipment == 'อื่นๆ'">
			<label for="inputEmail3" class="col-sm-2 col-form-label">อื่นๆ</label>
			<div class="col-sm-10">
				<input type="text" v-model="form.other" class="form-control"
					placeholder="กรอก ข้อมูลที่ไม่มีในตัวเลือก">

			</div>
		</div>
		<div class="row mb-3">
			<label for="inputEmail3" class="col-sm-2 col-form-label">ปัญหา/อาการ</label>
			<div class="col-sm-10">
				<input v-model="form.problem_symptom" type="text" class="form-control"
					placeholder="กรอก ปัญหาหรืออาการที่ต้องการแจ้ง">

			</div>
		</div>
		<fieldset class="row mb-3">
			<legend class="col-form-label col-sm-2 pt-0">ความเร่งด่วน</legend>
			<div class="col-sm-10">
				<div class="form-check">
					<input class="form-check-input" type="radio" value="เร่งด่วน" v-model="form.requirements">
					<label class="form-check-label">
						เร่งด่วน
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" value="ปกติ" v-model="form.requirements">
					<label class="form-check-label">
						ปกติ
					</label>
				</div>
			</div>
		</fieldset>
		<!-- <button @click="setFORMON()">x</button> -->
		<button class="btn btn-primary" @click="Register()">การแจ้งซ่อม</button>

	</div>
	<!-- <button @click="Register()"></button> -->
</template>

<script>
import axios from 'axios';
import { URL_API, URL_PUST_ADD_INFORMATION, URL_PUST_REGISTER } from '../constants';
import Swal from 'sweetalert2';






export default {
	props: {
		getformon: {
			required: true,
		},
	},
	data() {
		return {
			show_User_List: false,
			report: ['คอมพิวเตอร์แม่ข่าย',
				'คอมพิวเตอร์ตั้งโต๊ะ(pc)',
				'คอมพิวเตอร์พกพา(NoteBook)',
				'เครื่องสแกนเนอร์(Scnner)',
				'ครื่องพิมพ์(printer)',
				'แป้นพิมพ์(KeyBoard)',
				'เม้าส์usb(mouseusb)',
				'อินเทอร์เน็ต(Internet)',
				'อื่นๆ'],
			form: {
				responsible_person: "",
				work_group: '',
				work: '',
				phone: '',
				equipment: "",
				computer_name: "",
				commodity_code: '',
				ip_address: '',
				other: '',
				problem_symptom: '',
				requirements: "ปกติ",
			},
			get: []
		};
	},
	mounted() {

	},

	methods: {
		setFORMON() {
			$nuxt.$store.commit('steformON')
			// this.getformon = this.$store.state.formon
		},
		validate_Register() {
			var check = true;
			if (!this.form.responsible_person) {
				check = false;
			}
			if (!this.form.work_group) {
				check = false;
			}
			if (!this.form.work) {
				check = false;
			}
			if (!this.form.phone) {
				check = false;
			}
			if (!this.form.equipment) {
				check = false;
			}
			if (!this.form.problem_symptom) {
				check = false;
			}

			return check;

		},
		Register() {


			console.log(this.validate_Register());
			if (this.validate_Register()) {
				axios.post(`${URL_PUST_ADD_INFORMATION}`, {
					staus: "รอตอบรับ",
					date_repair: new Date,
					responsible_person: this.form.responsible_person,
					name_sender: this.form.responsible_person,
					work_group: this.form.work_group,
					work: this.form.work,
					phone: this.form.phone,
					equipment: this.form.equipment,
					computer_name: this.form.computer_name,
					commodity_code: this.form.commodity_code,
					ip_address: this.form.ip_address,
					other: this.form.other,
					problem_symptom: this.form.problem_symptom,
					requirements: this.form.requirements,
					user_id: this.$store.state.newUSER.user_id
					// name_responsible: "ชื่อผู้รับadd",

				}).then(response => {
					// console.log('post', response);

					Swal.fire({
						position: "center",
						icon: "success",
						title: "กำลังทำการแจ้งซ่อม",
						text: 'รอประมาณ 10-15 นาที',
						showConfirmButton: false,
						timer: 1500
					}).then(() => {
						// window.location.reload(0)
						this.form.responsible_person = "",
							this.form.work_group = '',
							this.form.work = '',
							this.form.phone = '',
							this.form.equipment = "",
							this.form.computer_name = "",
							this.form.commodity_code = '',
							this.form.ip_address = '',
							this.form.other = '',
							this.form.problem_symptom = '',
							this.form.requirements = "ปกติ",
							this.setFORMON()
					});

				})
			} else {
				Swal.fire({
					position: "center",
					icon: "warning",
					title: "มีข้อมูลว่าง",
					text: 'กรุณาเช็คข้อมูล',
					showConfirmButton: false,
					timer: 5500
				})
			}

		}
	},

	watch: {

	},
	computed: {},
	components: {}
}

// onCurrentPage: function (page) {
//       this.$emit("pagechanged", page);
//     },
</script>


<style>
.FormR-home {
	display: flex;
	/* background-color: blueviolet; */
	flex-direction: column;
}
</style>