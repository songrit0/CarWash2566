<template>
  <div class="div-home">
    <div class="div-home-pages">
      <h1>กรอกรายละเอียดสินค้า</h1>

      <div class="div-home-row2 p-3 mb-2">
        <div class="container" style="width: 100%">
          <div class="row g-2">
            <div class="col-12">
              <form>
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">ชื่อผู้ลูกค้า</label>
                  <div class="col-sm-10">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form_car.SC_username"
                    />
                  </div>
                </div>
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">ทะเบียนรถ</label>
                  <div class="col-sm-10">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form_car.SC_vehicle_registration"
                    />
                  </div>
                </div>
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">เบอร์โทร</label>
                  <div class="col-sm-10">
                    <input
                      type="text"
                      class="form-control"
                      v-model="form_car.SC_phone"
                    />
                  </div>
                </div>
              </form>
            </div>
            <div class="col-12">
              <div class="p-3 border bg-light">
                <div class="column">
                  <p>รายการล้างรถ</p>
                  <div class="">
                    <table class="table table-striped">
                      <tr>
                        <th>ON.</th>
                        <th>สินค้า</th>
                        <th>ราคา</th>
                        <th>จำนวน</th>
                        <th>รวม</th>
                      </tr>
                      <tr v-for="(item, idex) in car_wash_list" :key="idex">
                        <td>{{ item.CWL_ID }}</td>
                        <td>{{ item.CWL_product }}</td>
                        <td>{{ item.CWL_price }}$</td>
                        <td>{{ item.CWL_quantity }}</td>
                        <td>{{ item.CWL_total_price }}$</td>
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
                </div>
              </div>
              <br />
              <div
                v-if="car_wash_list"
                class="btn-group"
                role="group"
                aria-label="Basic outlined example column"
                style="width: 100%"
              >
                <button
                  disabled
                  type="button"
                  class="btn btn-outline-primary col-4"
                  style="
                    color: white;
                    border-top: 1px solid #ffffff;
                    border-bottom: 1px solid #ffffff;
                  "
                >
                  ....
                </button>
                <button
                  type="button"
                  class="btn btn-outline-primary col-4"
                  @click="clickaddcar()"
                >
                  ทำรายการ
                </button>
                <button
                  disabled
                  type="button"
                  class="btn btn-outline-primary col-4"
                  style="
                    color: white;
                    border-top: 1px solid #ffffff;
                    border-bottom: 1px solid #ffffff;
                  "
                >
                  ....
                </button>
              </div>
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

Vue.prototype.moment = moment;
export default {
  data() {
    return {
      USER_STAUS: this.$store.state.newUSER?.user_status,
      por_item: "",
      car_wash_list: "",
      car_wash_list_length: 0,
      form_car: {
        // SC_service_name: "",
        // user_id: "",
        // SC_status: "",
        SC_username: "",
        SC_vehicle_registration: "",
        SC_phone: "",
        // SC_Date: "",
        // SC_price: "",
      },
    };
  },

  methods: {
    clickaddcar(item) {
      var data2 = new Date();
      if (this.form_car.SC_phone) {
        if (this.form_car.SC_username) {
          if (this.form_car.SC_vehicle_registration) {
            axios
              .post(`${URL_IP}/addcar`, {
                SC_service_name: this.car_wash_list[0].CWL_ID,
                user_id: this.$store.state.newUSER.user_id,
                SC_status: "รอคิว",
                SC_username: this.form_car.SC_username,
                SC_vehicle_registration: this.form_car.SC_vehicle_registration,
                SC_phone: this.form_car.SC_phone,
                SC_Date: data2,
                SC_price: this.car_wash_list[0].CWL_total_price,
              })
              .then((response) => {
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

                setTimeout(() => {
                  axios.delete(
                    `${URL_IP}/delete_car_wash_list_user_id?id=${this.$store.state.newUSER.user_id}`
                  );
                }, 1000);

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
              })
              .catch(function (error) {});
          }
        }
      } else {
        Swal.fire({
          icon: "error",
          title: "มีข้อมูลยังไม่ได้กรอก",
          text: "หรือมีบางอย่างผิดพลาด!",
        });
      }
    },
    GETcar_wash_list() {
      axios
        .get(`${URL_IP}/car_wash_list?id=${this.$store.state.newUSER.user_id}`)
        .then((response) => {
          setTimeout(() => {
            this.car_wash_list = response.data.results;
          }, 100);

          //   console.log(response.data.results);
          //   this.car_wash_list_length = response.data.results.length;
        });
    },
  },
  mounted() {
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

.div-home-row2 {
  display: grid;
  grid-column-gap: 20px;
  column-gap: 20px;
  grid-row-gap: 20px;
  row-gap: 20px;
  grid-template-columns: 1fr;
}

.div-home-row2 .item {
  width: 100%;
  height: 185px;
  border-radius: 12px;
}

.div-home-row2-User {
  display: grid;
  grid-column-gap: 20px;
  column-gap: 20px;
  grid-row-gap: 20px;
  row-gap: 20px;
  grid-template-columns: 1fr 1fr 1fr 1fr;
}

.div-home-row2-User .item-User {
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
    .div-home-row2-User {
      grid-template-columns: 1fr 1fr 1fr;
    }

    @media screen and (max-width: 500px) {
      .div-home-row2-User {
        grid-template-columns: 1fr 1fr;
      }

      .div-home-row2 {
        grid-template-columns: 1fr;
      }
    }
  }
}
</style>