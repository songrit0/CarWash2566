<template>
  <div class="">
    <main class="d-flex flex-nowrap bg-secondary-subtle">
      <h1 class="visually-hidden">Sidebars examples</h1>
      <div
        class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark"
        style="width: 280px; background-color: #2b3035; height: 694px"
      >
        <a
          href="/"
          class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none"
          ><svg width="40" height="32" class="bi pe-none me-2">
            <use xlink:href="#bootstrap"></use>
          </svg>
          <span class="fs-4" style="color: white"
            >Admin_Tool
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="30"
              height="30"
              fill="#ffff"
              class="bi bi-tools"
              viewBox="0 0 16 16"
            >
              <path
                d="M1 0 0 1l2.2 3.081a1 1 0 0 0 .815.419h.07a1 1 0 0 1 .708.293l2.675 2.675-2.617 2.654A3.003 3.003 0 0 0 0 13a3 3 0 1 0 5.878-.851l2.654-2.617.968.968-.305.914a1 1 0 0 0 .242 1.023l3.27 3.27a.997.997 0 0 0 1.414 0l1.586-1.586a.997.997 0 0 0 0-1.414l-3.27-3.27a1 1 0 0 0-1.023-.242L10.5 9.5l-.96-.96 2.68-2.643A3.005 3.005 0 0 0 16 3c0-.269-.035-.53-.102-.777l-2.14 2.141L12 4l-.364-1.757L13.777.102a3 3 0 0 0-3.675 3.68L7.462 6.46 4.793 3.793a1 1 0 0 1-.293-.707v-.071a1 1 0 0 0-.419-.814L1 0Zm9.646 10.646a.5.5 0 0 1 .708 0l2.914 2.915a.5.5 0 0 1-.707.707l-2.915-2.914a.5.5 0 0 1 0-.708ZM3 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026L3 11Z"
              /></svg></span
        ></a>
        <hr style="color:#ffffff;" />
        <ul class="nav nav-pills flex-column mb-auto">
          <li>
            <a class=""
            :class="leitbar =='1' ? 'nav-link active':'nav-link text-white' " @click="ck(1)"
              ><svg width="16" height="16" class="bi pe-none me-2">
                <use xlink:href="#grid"></use>
              </svg>
              สมัครสมาชิก
            </a>
          </li>
          <li class="nav-item">
            <a  :class="leitbar =='2' ? 'nav-link active':'nav-link text-white' " @click="ck(2)"
              ><svg width="16" height="16" class="bi pe-none me-2">
                <use xlink:href="#home"></use>
              </svg>
              แก้ไขข้อมูลสมาชิก
            </a>
          </li>
          <li>
            <a :class="leitbar =='3' ? 'nav-link active':'nav-link text-white' " @click="ck(3)"
              ><svg width="16" height="16" class="bi pe-none me-2">
                <use xlink:href="#speedometer2"></use>
              </svg>
              แก้ไขข้อมูลสินค้า
            </a>
          </li>
          <li>
            <a :class="leitbar =='4' ? 'nav-link active':'nav-link text-white' " @click="ck(4)"
              ><svg width="16" height="16" class="bi pe-none me-2">
                <use xlink:href="#table"></use>
              </svg>
              รับคิว/ปรับสถานะ/จัดการ
            </a>
          </li>

        
        </ul>
        <hr style="color:#ffffff;"/>

      </div>
      <div class="b-example-divider b-example-vr" style="width: 100%">
        <br />
        
        <Register v-if="leitbar == 1" />
        <User_List v-if="leitbar == 2" />
        <NewItem v-if="leitbar == 3"  />
        <Status_pages v-if="leitbar == 4" />
        
      
      </div>
    </main>
  </div>
</template>

<script>
import NewItem from "./NewItem.vue";
import Register from "./Register.vue";
import Status_pages from "./Status_pages.vue";
import User_List from "./User_List.vue";

export default {
    data() {
        return {
            leitbar:1
        }
    },
  methods: {
ck(item){
    // console.log(item);
    this.leitbar = item
}
  },
  mounted(){

  },

  components: { User_List, Register, Status_pages, NewItem },
};
</script>

<style>
.nav-link:hover{
    background-color: #344762;
}
</style>