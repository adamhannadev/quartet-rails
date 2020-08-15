// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["title", "link", "part"]

  connect() {
    console.log("connecteed");
  }

  defineParams() {
    console.log(this.titleTarget.value + " - " + this.partTarget.value)
    this.linkTarget.href = `http://localhost:3000/mixes/new/${this.titleTarget.value}/${this.partTarget.value}`;
  }

}

