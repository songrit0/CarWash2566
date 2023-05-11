<template>
  <div class="div-home">
    <div class="div-home-pages">
      <h1 class="row">
        <p class="col-6">ระบบจัดการร้าน Car Care Service</p>
        <div
          class="form-check form-switch col"
          style="font-size: 20px;display: flex;align-items: center;"
        >
          <input
            class="form-check-input"
            type="checkbox"
            role="switch"
            id="flexSwitchCheckDefault"
            v-model="Car_Care_ON"
          />
          <label class="form-check-label" 
            > เปิด ดูข้อมูล</label
          >
        </div>
        <div
          class="btn-group col-4"
          role="group"
          aria-label="Basic outlined example"
        >
          <button type="button" class="btn btn-outline-primary" disabled>
            รอคิว [0]
          </button>
          <button type="button" class="btn btn-outline-primary" disabled>
            รอชำระเงิน [0]
          </button>
          <button type="button" class="btn btn-outline-primary" disabled>
            รับรถแล้ว [0]
          </button>
        </div>
      </h1>
      <status v-if="Car_Care_ON" />
      <div class="div-home-row p-3 mb-2" v-if="!Car_Care_ON">
        <div class="item p-3 back-img-registerr">
          <!-- <div class="container"> -->
          <div class="row row-cols-2">
            <div
              class="col p-2 item-img-01"
              v-for="(item, idex) in por_item"
              :key="idex"
            >
              <img
                src="https://i.pinimg.com/564x/0c/53/87/0c53874936e3bef1402859857e021c68.jpg"
                width="60"
                alt=""
              />
              <div class="">{{ item.Pro_name }}</div>
              <button
                v-if="car_wash_list_length <= 0"
                style="width: 100%; height: 50px"
                type="button"
                class="btn btn-primary"
                @click="clickaddcar(item)"
              >
                เลือก {{ item.Pro_price }}
                <p style="font-size: 10px; color: white">บาท</p>
              </button>
              <button
                disabled
                v-if="!car_wash_list_length <= 0"
                style="width: 100%; height: 50px"
                type="button"
                class="btn btn-danger"
              >
                เลือก {{ item.Pro_price }}
                <p style="font-size: 10px; color: white">บาท</p>
              </button>
            </div>
          </div>
          <!-- </div> -->
        </div>
        <div class="item p-3 back-img-register container">
          <div class="column">
            <p>รายการล้างรถ {{ get }} : {{ car_wash_list_length }}</p>
            <div class="">
              <table class="table table-striped">
                <tr>
                  <th>ON.</th>
                  <th>สินค้า</th>
                  <th>ราคา</th>
                  <th>จำนวน</th>
                  <th>รวม</th>
                  <th>ลบ</th>
                </tr>
                <tr v-for="(item, idex) in car_wash_list" :key="idex">
                  <td>{{ item.CWL_ID }}</td>
                  <td>{{ item.CWL_product }}</td>
                  <td>{{ item.CWL_price }}$</td>
                  <td>{{ item.CWL_quantity }}</td>
                  <td>{{ item.CWL_total_price }}$</td>
                  <td>
                    <a style="color: red" @click="clickdelete(item.CWL_ID)"
                      >ลบ</a
                    >
                  </td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
              </table>
            </div>
            <div
              v-if="car_wash_list"
              class="btn-group"
              role="group"
              aria-label="Basic outlined example column"
              style="width: 100%"
            >
              <button
                type="button"
                class="btn btn-outline-primary col-4"
                @click="clickdeleteAll()"
              >
                ลบทั้งหมด
              </button>
              <button
                type="button"
                class="btn btn-outline-primary col-4"
                style="
                  color: white;border-top: 1px solid #ffffff;
                  border-bottom: 1px solid #ffffff;
                "
                disabled
              >
                ....
              </button>
              <button
                type="button"
                class="btn btn-outline-primary col-4"
                @click="go()"
              >
                ทำรายการ
              </button>
            </div>
          </div>
        </div>
      </div>
      <br />
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { URL_GET_REQ, URL_IP } from "../constants";
import moment from "moment";
import Vue from "vue";
import Swal from "sweetalert2";
import Status from "../components/Status.vue";

Vue.prototype.moment = moment;
export default {
  components: { Status },
  data() {
    return {
      get: "1/1/2000",
      USER_STAUS: this.$store.state.newUSER?.user_status,
      por_item: "",
      car_wash_list: "",
      car_wash_list_length: 0,
      Car_Care_ON: false,
    };
  },

  methods: {
    go() {
      window.location.replace(`/addcar`);
    },
    GETpor_item() {
      axios.get(`${URL_IP}/pro_item`).then((response) => {
        this.por_item = response.data.results;
        // console.log(response.data.results);
      });
    },
    GETcar_wash_list() {
      axios
        .get(`${URL_IP}/car_wash_list?id=${this.$store.state.newUSER.user_id}`)
        .then((response) => {
          this.car_wash_list = response.data.results;
          // console.log(response.data.results);
          // this.car_wash_list_length = response.data.results.length;
        });
    },
    GETdate() {
      var get = new Date();
      this.get = moment().format("Do MMM YY");
    },
    clickdelete(id) {
      axios.delete(`${URL_IP}/delete_car_wash_list?id=${id}`);
      setTimeout(() => {
        this.GETcar_wash_list();
      }, 100);
    },
    clickdeleteAll(id) {
      axios.delete(
        `${URL_IP}/delete_car_wash_list_user_id?id=${this.$store.state.newUSER.user_id}`
      );
      setTimeout(() => {
        this.GETcar_wash_list();
        setTimeout(() => {
          this.car_wash_list = "";
        }, 100);
      }, 100);
    },
    clickaddcar(item) {
      setTimeout(() => {
        this.GETcar_wash_list();
      }, 10);
      axios
        .post(`${URL_IP}/car_wash_list`, {
          user_id: this.$store.state.newUSER.user_id,
          CWL_product: item.Pro_name,
          CWL_price: item.Pro_price,
          CWL_quantity: 3,
          CWL_total_price: 3 * item.Pro_price,
        })
        .then((response) => {
          if (response.data.status === "ok") {
            Swal.fire({
              position: "center",
              icon: "success",
              title: "สมัครสมาชิกสำเร็จ",
              showConfirmButton: false,
              timer: 1500,
            }).then(() => {});
          }
          if (response.data.status === "error") {
            alert("error");
          }
          if (response.data.status === "err") {
            alert("err");
          }
        })
        .catch(function (error) {
          console.log(error);
        });
    },
  },
  mounted() {
    this.GETpor_item();
    this.GETdate();
    this.GETcar_wash_list();
    setInterval(() => {
      this.GETcar_wash_list();
    }, 100);
  },
  watch: {},
};
</script>

<style>
.item-img-01 {
  display: flex;
  flex-direction: column;
  flex-wrap: nowrap;
  align-items: center;
  height: 150px;
  width: 190px;
  justify-content: space-between;
}
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
  grid-template-columns: 2fr 1fr;
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
  box-shadow: -29px 29px 58px #8f8f8f, 29px -29px 10px #ffffff;
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

.background-img-user {
  background: url(~/img/how_to_reg_FILL0_wght400_GRAD0_opsz48.svg);
  background-repeat: no-repeat;
  background-position: bottom right;
  background-size: 60px;
  background-color: #c7c7ff;
}
.background-img-I {
  background: url(~/img/database.svg);
  background-repeat: no-repeat;
  background-position: bottom right;
  background-size: 60px;
  background-color: #c7c7ff;
}
.background-img-I2 {
  background: url(~/img/clipboard-minus.svg);
  background-repeat: no-repeat;
  background-position: bottom right;
  background-size: 60px;
  background-color: #c7c7ff;
}
.background-img-register {
  background: url(~/img/app_registration_FILL0_wght400_GRAD0_opsz48.svg);
  background-repeat: no-repeat;
  background-position: bottom right;
  background-size: 60px;
  background-color: #c7c7ff;
}
.background-img-Repair {
  background: url(~/img/construction_FILL0_wght400_GRAD0_opsz48.svg);
  background-repeat: no-repeat;
  background-position: bottom right;
  background-size: 60px;
  background-color: #c7c7ff;
}
.background-img-Notification {
  background: url(~/img/home_repair_service_FILL0_wght400_GRAD0_opsz48.svg);
  background-repeat: no-repeat;
  background-position: bottom right;
  background-size: 60px;
  background-color: #c7c7ff;
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