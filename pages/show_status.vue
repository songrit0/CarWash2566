<template>
  <div class="">
    <br />
    <br />
    <br />
    <p v-if="Print_on">-------------------------------------------------------------------------------------------------------------✂️-------</p>
    <br />
    <h4 class="display-6 fst-italic" style="transform: translate(50px, 0px)">
      ระบบจัดการร้าน Car Care Service
    </h4>
    <main class="container">
      <div class="p-4 p-md-5 mb-4 text-white rounded bg-dark">
        <div class="col-md-12 px-0">
       
          <h5 style="color: white">รายการรับรถ/รอคิว</h5>
          <h6 style="color: white">
            bill ID : (showformID_{{ show_status.SC_id }})-(userID_{{show_status.user_id}})-{{ getDATE(show_status.SC_Date) }} {{  }}
          </h6>
          <div class="col-lg-12 col-md-8 mx-auto">
      
            <table class="table table-sm">
              <caption></caption>
              <thead  style="color: white;">
                <tr class="My">
                  <th>OrderID.</th>
                  <th>รายการ</th>
                  <th>ทะเบียน</th>
                  <th>ราคา</th>
                  <th>ว/ด/ป/</th>
                  <th>ปรับสถานะ</th>
                  
                </tr>
                <tr class="My">
                  <td>{{ show_status.SC_id }}</td>
                  <td>{{ show_status.SC_service_name }}</td>
                  <td>{{ show_status.SC_vehicle_registration }}</td>
                  <td>{{ show_status.SC_price }}$</td>
                  <td>{{ getDATE2(show_status.SC_Date)}}</td>
                  <td>{{ show_status.SC_status}}</td>
                
                  <td>
                 
                  </td>
                </tr>
              </thead>
              
              
            </table>
            <div class="Mybay"><p class=" My">ค่าบริการ </p><p class=" My">{{ show_status.SC_price }} บาท</p></div>
            <div class="Mybay"><p class=" My">+ค่าพนักงาน10%  </p><p class=" My"> {{show_sem(show_status.SC_price)}} บาท</p></div>
            <div class="Mybay"><p class=" My">รวม  </p><p class=" My"> {{SM(show_sem(show_status.SC_price),show_status.SC_price)}}บาท</p></div>
            <a href="#" class="btn btn-primary my-2" v-if="!Print_on" @click="Print">Print</a>
    
          </div>
          
        </div>
      </div>
    </main>
  </div>
</template>

<script>
import axios from "axios";
import { URL_IP } from "../constants";
import moment from 'moment';

export default {
  data() {
    return {
      show_status: "",
      Print_on:false
    };
  },
  methods: {
    Print(){
      this.Print_on = !this.Print_on
      
      setTimeout(() => {
        window.print()
        setTimeout(() => {
          this.Print_on = false
        }, 1000);
      }, 500);
     
    },
    show_sem(item) {
     return 10 / 100* item
    },
    SM(i1,i2){
      var v1 = Number(i1)
      var v2 = Number(i2)
      return v1+v2
    },
    getDATE(item) {
    
      return moment(item).format();  
    },
    getDATE2(item) {
      var d = new Date(item).getDate();
      var m = new Date(item).getMonth();
      var y = new Date(item).getFullYear();
      return `${d} / ${m + 1} / ${y}`;
    },
    GETshow_status() {
      axios.get(`${URL_IP}/Get_By_ID_status_car?id=${ this.$route.query.id}`).then((response) => {
        setTimeout(() => {
          this.show_status = response.data.results[0];
        }, 100);

        //   console.log(response.data.results);
        //   this.car_wash_list_length = response.data.results.length;
      });
    },
  },
  mounted() {
    this.GETshow_status();
  },
};
</script>

<style>
.Mybay{
  display: flex;
    justify-content: space-between;
}
.My {
  color: white;
}
.My th{
  color: white;
}.My td{
  color: white;
}
</style>