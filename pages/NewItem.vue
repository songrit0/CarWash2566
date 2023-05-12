<template>
  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <button
        @click="add.add_ON = !add.add_ON"
        type="button"
        class="btn btn-outline-dark"
        style="height: 50px; width: 105px; font-size: 96%; position: absolute"
      >
        <p style="transform: translate(0px, -5px)">เพิมข้อมูลสินค้า</p>
      </button>
      <ul
        v-if="add.add_ON"
        class="dropdown-menu position-static d-grid gap-1 p-2 rounded-3 mx-0 shadow w-220px"
        data-bs-theme="light"
      >
        <h5>เพิมข้อมูลสินค้า</h5>
        <div class="col-12">
          <label class="visually-hidden">รายการ</label>
          <div class="input-group">
            <div class="input-group-text">รายการ</div>
            <input
              type="text"
              class="form-control"
              placeholder="ชื้อรายการ"
              v-model="Edit_por.Pro_name"
            />
          </div>
        </div>
        <div class="col-12">
          <label class="visually-hidden">ราคา</label>
          <div class="input-group">
            <div class="input-group-text">ราคา</div>
            <input
              v-model="Edit_por.Pro_price"
              type="number"
              class="form-control"
              placeholder="ราคาของรายการ"
            />
          </div>
        </div>
        <li><hr class="dropdown-divider" /></li>
        <div class="col-12">
          <button
            type="button"
            class="btn btn-outline-primary"
            @click="pro_EDIT()"
          >
            บันทึก
          </button>
          <button
            type="button"
            class="btn btn-outline-danger"
            @click="Cancel()"
          >
            ยกเลิก
          </button>
        </div>
      </ul>
      <ul
        v-if="Edit_por.Pro_id"
        class="dropdown-menu position-static d-grid gap-1 p-2 rounded-3 mx-0 shadow w-220px"
        data-bs-theme="light"
      >
        <h5>แก้ไข ข้อมูลสินค้า</h5>
        <div class="col-12">
          <label class="visually-hidden">รายการ</label>
          <div class="input-group">
            <div class="input-group-text">รายการ</div>
            <input
              type="text"
              class="form-control"
              placeholder="ชื้อรายการ"
              v-model="Edit_por.Pro_name"
            />
          </div>
        </div>
        <div class="col-12">
          <label class="visually-hidden">ราคา</label>
          <div class="input-group">
            <div class="input-group-text">ราคา</div>
            <input
              v-model="Edit_por.Pro_price"
              type="number"
              class="form-control"
              placeholder="ราคาของรายการ"
            />
          </div>
        </div>
        <li><hr class="dropdown-divider" /></li>
        <div class="col-12">
          <button
            type="button"
            class="btn btn-outline-primary"
            @click="pro_EDIT()"
          >
            บันทึก
          </button>
          <button
            type="button"
            class="btn btn-outline-danger"
            @click="Cancel()"
          >
            ยกเลิก
          </button>
        </div>
      </ul>

      <div class="col-lg-12 col-md-8 mx-auto">
        <h1 class="fw-light">ตาราง ข้อมูลสินค้า</h1>
        <table class="table table-sm">
          <caption></caption>
          <thead>
            <tr>
              <th>ID.</th>
              <th>รายการ</th>
              <th>ราคา</th>
              <th>ปรับ</th>
              <th>ลบ</th>
            </tr>

            <tr v-for="(item, idex) in por_item" :key="idex">
              <td>{{ item.Pro_id }}</td>
              <td>{{ item.Pro_name }}</td>
              <td>{{ item.Pro_price }}</td>
              <td>
                <button
                  @click="Edit(item.Pro_id, item.Pro_name, item.Pro_price)"
                  type="button"
                  class="btn btn-outline-dark"
                  style="height: 25px; font-size: 100%"
                >
                  <p style="transform: translate(0px, -5px)">แก้ไข</p>
                </button>
              </td>

              <td>
                <button
                  type="button"
                  class="btn btn-outline-dark"
                  style="height: 25px; font-size: 100%"
                >
                  <p
                    style="transform: translate(0px, -5px)"
                    @click="delete_pro_item(item.Pro_id)"
                  >
                    ลบ
                  </p>
                </button>
              </td>
              <td></td>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </section>
</template>

<script>
import axios from "axios";
import { URL_IP } from "../constants";
import Swal from "sweetalert2";

export default {
  data() {
    return {
      por_item: "",
      add: {
        add_ON: false,
        Pro_name: "",
        Pro_price: "",
      },
      Edit_por: {
        Pro_id: "",
        Pro_name: "",
        Pro_price: "",
      },
    };
  },
  methods: {
    Cancel() {
      if (this.add.add_ON) {
        this.add.add_ON = !this.add.add_ON;
        this.Edit_por.Pro_id = "";
        this.Edit_por.Pro_name = "";
        this.Edit_por.Pro_price = "";
      } else {
        this.Edit_por.Pro_id = "";
        this.Edit_por.Pro_name = "";
        this.Edit_por.Pro_price = "";
      }
    },
    Edit(Pro_id, Pro_name, Pro_price) {
      this.Edit_por.Pro_id = Pro_id;
      this.Edit_por.Pro_name = Pro_name;
      this.Edit_por.Pro_price = Pro_price;
    },

    GETpor_item() {
      axios.get(`${URL_IP}/pro_item`).then((response) => {
        this.por_item = response.data.results;
        // console.log(response.data.results);
      });
    },
    delete_pro_item(id) {
      axios.delete(`${URL_IP}/delete_pro_item?id=${id}`).then(() => {
        this.GETpor_item();
        this.Cancel();
        Swal.fire({
          position: "center",
          icon: "success",
          title: "ลบสำเร็จ",
          showConfirmButton: false,
          timer: 1500,
        }).then(() => {});
      });
    },
    pro_EDIT() {
      if (this.add.add_ON) {
        axios
          .post(`${URL_IP}/add_pro_item`, {
            Pro_name: this.Edit_por.Pro_name,
            Pro_price: this.Edit_por.Pro_price,
          })
          .then(() => {
            this.GETpor_item();
            this.Cancel();
            Swal.fire({
              position: "center",
              icon: "success",
              title: "บันทึกสำเร็จ",
              showConfirmButton: false,
              timer: 1500,
            }).then(() => {});
          });
      } else {
        axios
          .put(`${URL_IP}/edit_pro_item?id=${this.Edit_por.Pro_id}`, {
            Pro_name: this.Edit_por.Pro_name,
            Pro_price: this.Edit_por.Pro_price,
          })
          .then(() => {
            this.GETpor_item();
            this.Cancel();
            Swal.fire({
              position: "center",
              icon: "success",
              title: "บันทึกสำเร็จ",
              showConfirmButton: false,
              timer: 1500,
            }).then(() => {});
          });
      }
    },
  },

  mounted() {
    this.GETpor_item();
  },
};
</script>

<style>
</style>