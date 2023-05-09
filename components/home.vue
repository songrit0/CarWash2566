<template>
  <div class="div-home">
    <div class="div-home-pages">
      <h1>ระบบจัดการร้าน Car Care Service</h1>
      <div class="div-home-row p-3 mb-2">
        <div class="item p-3 back-img-registerr">
          <!-- <div class="container"> -->
          <div class="row row-cols-2">
            <div class="col p-2 item-img-01">
              <div class="">img</div>
              <button type="button" class="btn btn-primary">เลือก</button>
            </div>
            <div class="col p-2 item-img-01">
              <div class="">img</div>
              <button type="button" class="btn btn-primary">เลือก</button>
            </div>
            <div class="col p-2 item-img-01">
              <div class="">img</div>
              <button type="button" class="btn btn-primary">เลือก</button>
            </div>
            <div class="col p-2 item-img-01">
              <div class="">img</div>
              <button type="button" class="btn btn-primary">เลือก</button>
            </div>
            <div class="col p-2 item-img-01">
              <div class="">img</div>
              <button type="button" class="btn btn-primary">เลือก</button>
            </div>
            <div class="col p-2 item-img-01">
              <div class="">img</div>
              <button type="button" class="btn btn-primary">เลือก</button>
            </div>
          </div>
          <!-- </div> -->
        </div>
        <div class="item p-3 back-img-register container">
          <div class="column">
            <p>รายการล้างรถ {{ get }}</p>
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
				  <tr>
					<td>A01</td>
					<td>Maria</td>
					<td>200$</td>
					<td>2</td>
					<td>400$</td>
					<td><a href="" style=" color: red">ลบ</a></td>
				  </tr>
				
              </table>
            </div>
          </div>
        </div>
      </div>
      <br />
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      get: "1/1/2000",
      USER_STAUS: this.$store.state.newUSER?.user_status,
    };
  },
  methods: {},
  mounted() {},
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
  width: 90px;
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