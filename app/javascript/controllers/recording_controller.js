// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

const audioType = "audio/wav";

export default class extends Controller {
  static targets = ["activeTrack", "saved", "recFile", "part", "title", "user", "backingTrack"]

  connect() {
    console.log("Hello from the recording controller.")
    this.state = {
      audios: []
    }
    this.initRecording();
  }

  async initRecording() {
    const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
    this.activeTrackTarget.srcObject = stream;
    // init recording
    this.mediaRecorder = new MediaRecorder(stream);
    // init data storage for audio chunks
    this.chunks = [];
    // listen for data from media recorder
    this.mediaRecorder.ondataavailable = (e) => {
      if (e.data && e.data.size > 0) {
        this.chunks.push(e.data);
      }
    };
  }


  start(e) {
    e.preventDefault();
    // this.bgAudio.play();
    // wipe old data chunks
    this.chunks = [];
    // start recorder with 10ms buffer
    this.mediaRecorder.start(10);
  }

  stop(e) {
    e.preventDefault();
    // this.bgAudio.pause();
    // this.bgAudio.currentTime = 0;
    // stop the recorder
    this.mediaRecorder.stop();
    // say that we're not recording
    this.saveAudio();
  }

  saveAudio() {
    // convert saved chunks to blob
    const blob = new Blob(this.chunks, { type: audioType });
    // generate audio url from blob
    const audioURL = window.URL.createObjectURL(blob);
    this.savedTarget.src = audioURL;
    this.recFileTarget.href = audioURL;
    this.recFileTarget.download = `${this.userTarget.innerHTML.split("@")[0]}-${this.titleTarget.value}-${this.partTarget.value}`;

  }

}

