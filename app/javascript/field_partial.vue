<template>
  <div class="columns">
    <div class="column">
      <div class="field">
        <label class="label">Field Reference</label>
        <div class="control">
          <input class="input"
                 type="text"
                 placeholder="Text input"
                 v-model="reference">
        </div>
      </div>
    </div>

    <div class="column">
      <div class="field">
        <label class="label">Quantity</label>
        <div class="control">
          <input class="input"
                 type="text"
                 placeholder="Text input"
                 v-model="quantity">
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        reference: this.field.reference,
        quantity: this.field.quantity
      }
    },
    props: ['field']
  }
</script>
