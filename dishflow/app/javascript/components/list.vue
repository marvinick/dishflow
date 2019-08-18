<template>
  <div class="list">
    <h4 class="bold">{{ list.name }}</h4>
    <h6>{{ list.description }}</h6>

    <draggable v-model="list.foods" :options="{group: 'foods'}" class="dragArea" @change="foodMoved">
      <food v-for="food in list.foods" :food="food" :list="list"></food>
    </draggable>

    <!-- <button v-if="!editing" v-on:click="startEditing" class="btn btn-dark">Add a dish</button> -->
    <input v-if="editing" ref="message" v-model="message" class="form-control"></input>
    <input v-if="editing" ref="description" v-model="description" class="form-control"></input>
    <input v-if="editing" ref="price" v-model="price" class="form-control"></input>
    <button v-if="editing" v-on:click="createFood" class="btn btn-dark">Submit a new Dish</button>
    <button v-if="editing" v-on:click="editing=false" class="btn btn-danger">Cancel</button>
  </div>
</template>

<script>
  import draggable from "vuedraggable"
  import food from 'components/food'
  import Rails from "rails-ujs"

  export default {
    components: { draggable, food },
    props: ["list"],

    data: function() {
      return {
        editing: false,
        message: "",
        description: "",
        price: "",
      }
    },

    methods: {
      startEditing: function() {
        this.editing = true
        this.$nextTick(() => { this.$refs.message.focus() })
      },

      foodMoved: function(event) {
        const evt = event.added || event.moved
        if (evt == undefined) {return}

        const element = evt.element

        const list_index = window.store.state.lists.findIndex((list) => {
          return list.foods.find((food) => {
            return food.id === element.id
          })
        })

        var data = new FormData
        data.append("food[list_id]", window.store.state.lists[list_index].id)
        data.append("food[position]", evt.newIndex + 1)

        Rails.ajax({
          url: `/menus/6/foods/${element.id}/move`,
          type: "PATCH",
          data: data,
          dataType: "json"
        })
      },

      createFood: function() {
        var data = new FormData
        data.append("food[list_id]", this.list.id)
        data.append("food[name]", this.message)
        data.append("food[description]", this.description)
        data.append("food[price]", this.price)

        var pathArray = window.location.pathname.split('/');
        var main_path = pathArray[0];
        var second_path = pathArray[1];
        var third_path = pathArray[2];

        Rails.ajax({
          url: '/' + second_path + '/' + third_path + '/foods',
          type: "POST",
          data: data,
          dataType: "json",
          success: (data) => {
            this.$store.commit('addFood', data)
            this.message = ""
            this.$nextTick(() => { this.$refs.message.focus() })
          }
        })
      },

    }
  }
</script>

<style scoped>
  .dragArea {
    min-height: 10px;
  }

</style>
