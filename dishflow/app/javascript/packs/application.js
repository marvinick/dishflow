// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery.raty

require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import Vue from 'vue/dist/vue.esm.js';
import Vuex from 'vuex';
import App from '../app.vue';
import VueResource from 'vue-resource';
import TurbolinksAdapter from 'vue-turbolinks';

Vue.use(Vuex)
Vue.use(VueResource)
Vue.use(TurbolinksAdapter)

window.store = new Vuex.Store({
  state: {
    lists: []
  },

  mutations: {
    addList(state, data) {
      state.lists.push(data)
    },
    addFood(state, data) {
      const index = state.lists.findIndex(item => item.id == data.list_id)
      state.lists[index].foods.push(data)
    },
    moveList(state, data) {
      const index = state.lists.findIndex(item => item.id == data.id)
      state.lists.splice(index, 1)
      state.lists.splice(data.position - 1, 0, data)
    },
    moveCard(state, data) {
      const old_list_index = state.lists.findIndex((list) => {
        return list.foods.find((food) => {
          return food.id === data.id
        })
      })
      const old_card_index = state.lists[old_list_index].cards.findIndex((item) => item.id == data.id)
      const new_list_index = state.lists.findIndex((item) => item.id == data.list_id)

      if (old_list_index != new_list_index) {
        // Remove food from old list, add to new one
        state.lists[old_list_index].cards.splice(old_card_index, 1)
        state.lists[new_list_index].cards.splice(data.position - 1, 0, data)
      } else {
        state.lists[new_list_index].cards.splice(old_card_index, 1)
        state.lists[new_list_index].cards.splice(data.position - 1, 0, data)
      }
    },
    editFood(state, data) {
      const list_index = state.lists.findIndex((item) => item.id === data.list_id)
      const food_index = state.lists[list_index].foods.findIndex((item) => item.id === data.id)
      state.lists[list_index].foods.splice(food_index, 1, data)
    }
  }
})

document.addEventListener("turbolinks:load", function() {
  var element = document.querySelector("#boards")
  if (element != undefined) {
    window.store.state.lists = JSON.parse(element.dataset.lists)

    const app = new Vue({
      el: element,
      store: window.store,
      template: "<App />",
      components: { App },
      // mixins: [TurbolinksAdapter]
    })
  }
})

document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

  var element = document.getElementById("list-form")

  if (element != null) {

    var id = element.dataset.id
    var list = JSON.parse(element.dataset.list)
    var foods_attributes = JSON.parse(element.dataset.foodsAttributes)
    foods_attributes.forEach(function(food) { food._destroy = null })
    list.foods_attributes = foods_attributes

    var app = new Vue({
      el: element,
      data: function() {
        return { id: id, list: list}
      },
      methods: {
        addFood: function() {
          this.list.foods_attributes.push({
            id: null,
            name: "",
            _destroy: null
          })
        },

        removeFood: function(index) {
          var food = this.list.foods_attributes[index]
          if (food.id == null) {
            this.list.foods_attributes.splice(index, 1)
          } else {
            this.list.foods_attributes[index]._destroy = "1"
          }
        },

        undoRemove: function(index) {
          this.list.foods_attributes[index]._destroy = null
        },

        saveList: function() {
          if (this.id == null) {
            this.$http.post(`/menus/4/lists`, { list: this.list}).then(response => {
              console.log(response)
              Turbolinks.visit(`/menus/4/lists/${response.body.id}` )
              // Turbolinks.visit(`/menus/:menu_id/${response.body.id}`)
            }, response => {
              console.log(response)
            })
          } else {
            this.$http.put(`/menus/4/lists/${this.id}`, { list: this.list}).then(response => {
              Turbolinks.visit(`/menus/4/lists/${response.body.id}`)
            }, response => {
              console.log(response)
            })
          }
        },
        existingList: function() {
          return this.list.id != null
        }
      }
    })
  }
})

document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

  var element = document.getElementById("menu-form")

  if (element != null) {

    var id = element.dataset.id
    var menu = JSON.parse(element.dataset.menu)
    var ratings_attributes = JSON.parse(element.dataset.ratingsAttributes)
    ratings_attributes.forEach(function(rating) { rating._destroy = null })
    menu.ratings_attributes = ratings_attributes

    var app = new Vue({
      el: element,
      data: function() {
        return { id: id, menu: menu}
      },

      methods: {
        addRating: function() {
          this.menu.ratings_attributes.push({
            id: null,
            name: "",
            _destroy: null
          })
        },

        removeRating: function(index) {
          var rating = this.menu.ratings_attributes[index]
          if (rating.id == null ) {
            this.menu.ratings_attributes.splice(index, 1)
          } else {
            this.menu.ratings_attributes[index]._destroy = "1"
          }
        },

        cancelRemove: function(index) {
          this.menu.ratings_attributes[index]._destroy = null
        },

        saveMenu: function() {
          if (this.id == null) {
            this.$http.post(`/menus`, { menu: this.menu}).then(response => {
              console.log(response)
              Turbolinks.visit(`/menus/${response.body.id}`)
            }, response => {
              console.log(response)
            })
          } else {
            this.$http.put(`/menus/${this.id}`, { menu: this.menu}).then(response => {
              Turbolinks.visit(`/menus/${response.body.id}`)
            }, response => {
              console.log(response)
            })
          }
        },

        existingMenu: function() {
          return this.list.id != null
        }
      }
    })
  }
})


require("trix")
require("@rails/actiontext")
