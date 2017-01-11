<map class={ reveal: reveal }>

  <div id="$mapContainer"
       class="map-container">
    <scene id="$start"
           option="START"
           scenes={ scenes }
           scene={ scenes[0] }></scene>
  </div>

  <script type="es6">

    this.reveal = false
    this.scrollTop = 0
    this.scrollLeft = 0

    this.scenes = opts.scenes
    this.responses = opts.config.responses
    this.skillName = opts.config.skillName

    window.isLinking = false;
    window.linkingSourceId = -1;



    var subRoute = riot.route.create()

    subRoute( x => {
      this.update()
    })

    this.on('mount', x => {
      resize.bind( this )()
    })

    this.on('update', x => {
      this.scrollTop = this.root.scrollTop
      this.scrollLeft = this.root.scrollLeft
    })

    this.on('updated', x => {
      resize.bind( this )()
      this.root.scrollTop = this.scrollTop
      this.root.scrollLeft = this.scrollLeft
    })

    window.addEventListener('resize', resize.bind( this ) )
    window.addEventListener('start_link', startLink.bind( this ) )
    window.addEventListener('stop_link', stopLink.bind( this ) )

    function startLink ( e ) {
console.log("start link event");
document.getElementById("$mapContainer").style.background="#999";

}
    function stopLink ( e ) {
console.log("stop link event");
document.getElementById("$mapContainer").style.background="";
}




    function resize ( e ) {
      var width = this.$start.querySelector('.row > scene').clientWidth
      this.$mapContainer.style.width = Math.max( width, this.$mapContainer.clientWidth ) + 'px'
      this.root.scrollLeft = ( width - this.root.clientWidth ) / 2
    }

  </script>
</map>
