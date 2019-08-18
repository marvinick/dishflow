<template>
  <draggable v-model="lists" :options="{group: 'lists'}" class="board dragArea" @end="listMoved">
    <list v-for="(list, index) in lists" :list="list"></list>

    <!-- <div class="list">
      <button v-if="!editing" v-on:click="startEditing" class="btn btn-dark">Add a list</button>
      <input v-if="editing" ref="message" v-model="message" class="form-control"></input>
      <input v-if="editing" ref="description" v-model="description" class="form-control"></input>
      <button v-if="editing" v-on:click="createList" class="btn btn-dark">Create a list</button>
      <button v-if="editing" v-on:click="editing=false" class="btn btn-danger">Cancel</button>
    </div> -->

  </draggable>
</template>

<script>
  import draggable from "vuedraggable"
  import list from "components/list"
  import Rails from "rails-ujs"

  export default {
    components: { draggable, list },

    data: function() {
      return {
        editing: false,
        message: "",
        description: "",
      }
    },

    computed: {
      lists: {
        get() {
          return this.$store.state.lists
        },
        set(value) {
          this.$store.state.lists = value
        },
      },
    },

    methods: {
      listMoved: function(event) {
        var data = new FormData
        data.append("list[position]", event.newIndex + 1)

        Rails.ajax({
          url: `/menus/4/lists/${this.lists[event.newIndex].id}/move`,
          type: "PATCH",
          data: data,
          dataType: "json",
        })
      },

      startEditing: function() {
        this.editing = true
        this.$nextTick(() => { this.$refs.message.focus() })
      },

      createList: function() {
        var data = new FormData
        data.append("list[name]", this.message)
        data.append("list[description]", this.description)

        var pathArray = window.location.pathname.split('/');
        var main_path = pathArray[0];
        var second_path = pathArray[1];
        var third_path = pathArray[2];

        Rails.ajax({
          url: '/' + second_path + '/' + third_path + '/lists',
          type: "POST",
          data: data,
          dataType: "json",
          success: (data) => {
            this.$store.commit('addList', data)
            this.message = ""
            this.editing = false
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
  .board {
    /* overflow-x: auto; */
    /* white-space: nowrap; */
  }

  .list {
    background: white;
    border-radius: 3px;
    /* display: inline-block; */
    margin-right: 20px;

    padding: 30px;
    vertical-align: top;
    width: 100%;
  }

</style>
