<template>
  <div v-if="destroy == '1'">
    <div class="disabled-field">
      <fieldset disabled>

      <div class="field">
        <div class="control">
          <input class="input"
                 type="text"
                 :placeholder="field.reference + ' / ' +
                 'This item will be destroy if you save the invoice, to undo click on the button -->'">
        </div>
      </div>

      </fieldset>
      <button class="undo-btn button is-warning" @click="undo(index)">
        <i class="fas fa-undo-alt"></i>
      </button>
    </div>
  </div>

  <div v-else class="columns">
    <div class="column">
      <div class="field">
        <label class="label">Field Reference</label>
        <div class="control">
          <input class="input required"
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
          <input class="input required"
                 type="text"
                 placeholder="Text input"
                 v-model="field.quantity"
                 @keyup="compute">
        </div>
      </div>
    </div>

    <div class="column is-2">
      <div class="field">
        <label class="label">Unit Price / HT</label>
        <div class="control has-icons-right">
          <input class="input required"
                 type="text"
                 placeholder="TJM / Unit price"
                 v-model="field.unit_price"
                 @keyup="compute">
          <span class="icon is-small is-right">
            <i class="fas fa-euro-sign"></i>
          </span>
        </div>
      </div>
    </div>

    <div class="column is-2">
      <fieldset disabled>
        <div class="field">
          <label class="label">Item Total / HT</label>
          <div class="control has-icons-right">
            <input class="input"
                   type="text"
                   placeholder="350"
                   v-model="field.unit_price * field.quantity">
            <span class="icon is-small is-right">
              <i class="fas fa-euro-sign"></i>
            </span>
          </div>
        </div>
      </fieldset>
    </div>

    <button class="button remove-btn" @click="removeItem(index)">X</button>

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

    .remove-btn {
      background-color: rgb(241, 69, 104);
      border-color: transparent;
      color: white;
      position: absolute;
      top: 45%;
      right: -40px;
    }
  }

  .disabled-field {
    position: relative;
    margin: 20px 0px;

    input::placeholder {
      color: lighten(red, 30%);
      margin: 0 auto;
    }

    button {
      position: absolute;
      top: 0;
      right: -52px;
    }

    .undo-btn {
      width: 44px;
    }
  }
</style>
