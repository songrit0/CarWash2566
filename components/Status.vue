<template>
  <div class="">
    
    <section class="py-5 text-center container">
     
      <div
      class="btn-group col-12"
      role="group"
      aria-label="Basic outlined example"
    >
      <button type="button" class="btn btn-outline-primary "  @click="STAUS = 'รอคิว'">
        รอคิว [0]
      </button>
      <button type="button" class="btn btn-outline-primary" @click="STAUS = 'รอชำระเงิน'">
        รอชำระเงิน [0]
      </button>
      <button type="button" class="btn btn-outline-primary" @click="STAUS = 'รับรถแล้ว'">
        รับรถแล้ว [0]
      </button>
    </div>
      <div class="row py-lg-5">
        <div class="col-lg-12 col-md-8 mx-auto">
          <h1 class="fw-light"> ตาราง  {{ STAUS }} </h1>
          <table class="table table-sm">
            <caption>List of {{all_status_ca}}</caption>
            <thead>
              <tr>
                <th>OrderID.</th>
                <th>รายการ</th>
                <th>ทะเบียน</th>
                <th>ราคา</th>
                <th>ว/ด/ป/</th>
                <th style="width: 125px;">ปรับสถานะ</th>
              </tr>
              <tr v-for="(item, index) in all_status_ca" :key="index">
                <td>{{item.SC_id}}</td>
                <td>{{item.SC_service_name}}</td>
                <td>{{item.SC_vehicle_registration}}</td>
                <td>{{item.SC_price}}</td>
                <td>{{getDATE(item.SC_Date) }}</td>
                <td><select class="form-select" aria-label="Default select example" v-model="select_mode">
                  <option value="รอคิว">รอคิว</option>
                  <option value="รอชำระเงิน">รอชำระเงิน</option>
                  <option value="รับรถแล้ว">รับรถแล้ว</option>
                </select></td>
              </tr>
            </thead>
            
          </table>
            <a href="#" class="btn btn-primary my-2">Main call to action</a>
            <a href="#" class="btn btn-secondary my-2">Secondary action</a>
          
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
      STAUS : 'รอคิว',
      select_mode: 'รอคิว',
      all_status_ca:''

    };
  },

  methods: {
    getDATE(item){
      var d = new Date(item).getDate()
      var m = new Date(item).getMonth()
      var y = new Date(item).getFullYear()
      return `${d} / ${m+1} / ${y}`
    },
    GETall_status_car() {
      axios
        .get(`${URL_IP}/Get_all_status_car?staus=${this.STAUS}&user_id=${this.$store.state.newUSER.user_id}`)
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
    this.GETall_status_car()
  },
  watch: {
    STAUS(){
      this.GETall_status_car()
    }
  },
};
</script>
  

<style>

</style>