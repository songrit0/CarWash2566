<template>
  <div class="">
    <section class="py-5 text-center container">
      <div
        class="btn-group col-12"
        role="group"
        aria-label="Basic outlined example"
      >
        <button
          type="button"
          class="btn btn-outline-primary"
          @click="STAUS = 'รอคิว'"
        >
          รอคิว [0]
        </button>
        <button
          type="button"
          class="btn btn-outline-primary"
          @click="STAUS = 'รอชำระเงิน'"
        >
          รอชำระเงิน [0]
        </button>
        <button
          type="button"
          class="btn btn-outline-primary"
          @click="STAUS = 'รับรถแล้ว'"
        >
          รับรถแล้ว [0]
        </button>
      </div>
      <div class="row py-lg-5">
        <div class="col-lg-12 col-md-8 mx-auto">
          <h1 class="fw-light">ตาราง {{ STAUS }}</h1>
          <table class="table table-sm">
            <caption></caption>
            <thead>
              <tr>
                <th>OrderID.</th>
                <th>รายการ</th>
                <th>ทะเบียน</th>
                <th>ราคา</th>
                <th>ว/ด/ป/</th>
                <th>รายละเอียด</th>
                <th style="width: 125px" >ปรับสถานะ</th>
              </tr>
              <tr v-for="(item, index) in all_status_ca" :key="index">
                <td>{{ item.SC_id }}</td>
                <td>{{ item.SC_service_name }}</td>
                <td>{{ item.SC_vehicle_registration }}</td>
                <td>{{ item.SC_price }}</td>
                <td>{{ getDATE(item.SC_Date) }}</td>
                <td>
                  <button
                    type="button"
                    class="btn btn-outline-dark"
                    style="height: 25px; font-size: 100%"
                  >
                    <p style="transform: translate(0px, -5px)" @click="goshow_status(item.SC_id)">รายละเอียด</p>
                  </button>
                  
                </td>
                <td>
                  <button
                    v-if="itemIF()"
                    type="button"
                    class="btn btn-outline-dark"
                    style="height: 25px; font-size: 15px"
                  >
                    <p
                      style="transform: translate(0px, -5px)"
                      @click="edit_status_car(item.SC_id, item.SC_status)"
                    >
                      ปรับสถานะ
                    </p>
                  </button>
                  <a v-if="!itemIF()">{{ item.SC_status }}</a>
                </td>
              </tr>
            </thead>
          </table>

      
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import axios from "axios";
import { URL_GET_REQ, URL_IP } from "../constants";
import moment from "moment";
import Vue from "vue";
import Swal from "sweetalert2";

Vue.prototype.moment = moment;
export default {
  data() {
    return {
      STAUS: "รอคิว",
      select_mode: "รอคิว",
      all_status_ca: "",
      Admin_ON: false,
    };
  },

  methods: {
    goshow_status(iD){
      // window.location.replace(`/show_status`);
      this.$router.push({path: '/show_status', query : { id: iD}});
    },
    getDATE(item) {
      var d = new Date(item).getDate();
      var m = new Date(item).getMonth();
      var y = new Date(item).getFullYear();
      return `${d} / ${m + 1} / ${y}`;
    },
    itemIF() {
      if (this.$store.state.newUSER.user_status == "admin") {
        if (this.STAUS == "รับรถแล้ว") {
          return false;
        }
        return true;
      } else {
        return false;
      }
      item.SC_status == "รอคิว" ||
        item.SC_status == "รอชำระเงิน" ||
        $nuxt.$store.state.newUSER.user_status == "admin";
    },
    edit_status_car(id, item) {
      // console.log(id);
      if (item == "รอคิว") {
        var itemS = "รอชำระเงิน";
      }
      if (item == "รอชำระเงิน") {
        var itemS = "รับรถแล้ว";
      }
      axios
        .put(`${URL_IP}/edit_status_car?id=${id}`, {
          SC_status: itemS,
        })
        .then((response) => {
          this.GETall_status_car();
          const Toast = Swal.mixin({
            toast: true,
            position: "top-end",
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            didOpen: (toast) => {
              toast.addEventListener("mouseenter", Swal.stopTimer);
              toast.addEventListener("mouseleave", Swal.resumeTimer);
            },
          });

          Toast.fire({
            icon: "success",
            title: "Signed in successfully",
          });

          if (response.data.status === "true") {
          }
          if (response.data.status === "error") {
            alert("error");
          }
          if (response.data.status === "err") {
            alert("err");
          }
        });
    },
    GETall_status_car() {
      if (this.$store.state.newUSER.user_status == "admin") {
        var UID = "";
      } else {
        var UID = this.$store.state.newUSER.user_id;
      }

      axios
        .get(`${URL_IP}/Get_all_status_car?staus=${this.STAUS}&user_id=${UID}`)
        .then((response) => {
          setTimeout(() => {
            this.all_status_ca = response.data.results;
          }, 100);

          //   console.log(response.data.results);
          //   this.car_wash_list_length = response.data.results.length;
        });
    },
  },
  mounted() {
    this.GETall_status_car();
  },
  watch: {
    STAUS() {
      this.GETall_status_car();
    },
    Admin_ON() {
      this.GETall_status_car();
    },
  },
};
</script>
  

<style>
</style>