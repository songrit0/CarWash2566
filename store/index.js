export const state = () => ({
  counter: 0,
  newUSER: "",
  formon: false,
  showformitem: { status: false, id: 0 },
  statusON: {
    lengthdata: 0,
    status: false,
  },
  //user

  //user END
});

export const getters = {
  getCounter(state) {
    return state.counter;
  },
  getUSER(state) {
    return state.newUSER;
  },
};

export const mutations = {
  increment(state) {
    state.counter++;
  },
  steUSER(state, payload) {
    state.newUSER = payload;
    // console.log(payload);
  },
  steformON(state) {
    state.formon = !state.formon;
    // console.log(state.formon);
  },
  setShowformitem(state, payload) {
    state.showformitem.status = payload;
    // console.log(1, payload);
  },
  setShowformitem_id(state, payload) {
    state.showformitem.id = payload;
    // console.log(2, payload);
  },
  setstatusON(state, payload) {
    state.statusON = payload;
  },
};

export const actions = {
  async getapiUSER(state, payload) {
    return s;
  },
  async fetchCounter({ state }) {
    // make request
    const res = { data: 10 };
    state.counter = res.data;
    return res.data;
  },
};
