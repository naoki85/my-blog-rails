import Vue from 'vue/dist/vue.esm.js'
import Vuex from 'vuex'
import auth from './modules/auth'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    auth
  }
})
