<template>
  <div v-if="destroy == '1'">
    <div class="disabled-field">
      <fieldset disabled>

      <div class="field">
        <div class="control">
          <input class="input" type="text" :placeholder="field.reference">
        </div>
      </div>

      </fieldset>
      <button class="undo-btn button is-warning" @click="undo(index)">O</button>
    </div>
  </div>

  <div v-else class="columns">
    <div class="column">
      <div class="field">
        <label class="label">Field Reference</label>
        <div class="control">
          <input class="input"
                 type="text"
                 placeholder="Text input"
                 v-model="field.reference">
        </div>
      </div>
    </div>

    <div class="column is-2">
      <div class="field">
        <label class="label">Quantity</label>
        <div class="control">
          <input class="input"
                 type="text"
                 placeholder="Text input"
                 v-model="field.quantity"
                 @keyup="compute">
        </div>
      </div>
    </div>

    <div class="column is-2">
      <div class="field">
        <label class="label">Unit Price</label>
        <div class="control">
          <input class="input"
                 type="text"
                 placeholder="350"
                 v-model="field.unit_price"
                 @keyup="compute">
        </div>
      </div>
    </div>

    <div class="column is-2">
      <div class="field">
        <label class="label">Item Total</label>
        <div class="control">
          <input class="input"
                 type="text"
                 placeholder="350"
                 v-model="field.unit_price * field.quantity">
        </div>
      </div>
    </div>

    <button class="button is-danger" @click="removeItem(index)">X</button>

  </div>
</template>

<script>
  export default {
    data() {
      return {
        destroy: null
      }
    },
    props: ['field', 'index'],
    methods: {
      removeItem(index) {
        this.destroy = '1'
        this.$parent.removeItem(index);
        this.$parent.compute();
      },
      undo(index) {
        this.destroy = null
        this.$parent.undo(index);
        this.$parent.compute();
      },
      compute() {
        this.$parent.compute();
      }
    }
  }
</script>

<style scoped lang="scss">
  .columns {
    position: relative;

    .is-danger {
      position: absolute;
      top: 45%;
      right: -40px;
    }
  }

  .disabled-field {
    position: relative;
    margin: 20px 0px;

    button {
      position: absolute;
      top: 0;
      right: -52px;
    }
  }
</style>
