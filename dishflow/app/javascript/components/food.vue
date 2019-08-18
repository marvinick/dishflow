<template>
  <div>
    <div @click="editing=true" class="card px-2 mb-2 border-0">
      <h6 class="bold">{{food.name}}</h6>
      <!-- <p>{{food.description}}</p>
      <p>{{food.price}}</p> -->
    </div>

    <div v-if='editing' class="modal-backdrop show"></div>

    <div v-if='editing' @click="closeModal" class="modal show" style="display: block">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">{{ food.name }}</h5>
          </div>
          <div class="modal-body">
            <input v-model="name" class="form-control"></input>
          </div>
          <div class="modal-footer">
            <button @click="save" type="button">Save</button>
          </div>
        </div>
      </div>
    </div>

  </div>
</template>

<script>
import Rails from "rails-ujs"

export default {
  props: ['food', 'list'],
  data: function() {
    return {
      editing: false,
      name: this.food.name,
    }
  },

  methods: {
    closeModal: function(event) {
      if (event.target.classList.contains("modal")) { this.editing = false }
    },

    save: function() {
      var data = new FormData
      data.append("food[name]", this.name)

      Rails.ajax({
        url: `/menus/6/foods/${this.food.id}`,
        type: "PATCH",
        data: data,
        dataType: "json",
        success: (data) => {
          this.$store.commit('editFood', data)
          this.editing = false
        }
      })
    }
  }
}
</script>

<style scoped>
</style>
