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
                    <input type="text" class="form-control" />
                  </div>
                </div>
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">ทะเบียนรถ</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" />
                  </div>
                </div>
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">เบอร์โทร</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" />
                  </div>
                </div>
              </form>
            </div>
            <div class="col-12">
              <div class="p-3 border bg-light">
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
                <button type="button" class="btn btn-outline-primary col-4">
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
      get: "1/1/2000",
      USER_STAUS: this.$store.state.newUSER?.user_status,
      por_item: "",
      car_wash_list: "",
      car_wash_list_length: 0,
      form_car: {
        SC_service_name: "",
        user_id: "",
        SC_status: "",
        SC_username: "",
        SC_vehicle_registration: "",
        SC_phone: "",
        SC_Date: "",
        SC_price: "",
      },
    };
  },

  methods: {
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
          this.car_wash_list_length = response.data.results.length;
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