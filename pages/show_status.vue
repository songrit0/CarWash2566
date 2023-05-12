<template>
  <div class="">
    <br />
    <br /><br />
    <h4 class="display-6 fst-italic" style="transform: translate(50px, 0px)">
      ระบบจัดการร้าน Car Care Service
    </h4>
    <main class="container">
      <div class="p-4 p-md-5 mb-4 text-white rounded bg-dark">
        <div class="col-md-6 px-0">
          <h5 style="color: white">รายการรับรถ/รอคิว</h5>
          <h6 style="color: white">
            bill ID : (showform{{ show_status.SC_id }})-(user{{show_status.user_id}})-{{ getDATE(show_status.SC_Date) }} {{  }}
          </h6>
          <p class="lead my-3" style="color: white">
            Multiple lines of text that form the lede, informing new readers
            quickly and efficiently about what’s most interesting in this post’s
            contents.
          </p>
          <p class="lead mb-0">
            <a href="#" class="text-white fw-bold">Continue reading...</a>
          </p>
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
    };
  },
  methods: {
    getDATE(item) {
    
      return moment(item).format();  
    },
    GETshow_status() {
      axios.get(`${URL_IP}/Get_By_ID_status_car?id=6`).then((response) => {
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
</style>