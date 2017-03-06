<scene id="scene-{ opts.scene.id }" class={ 'is-selected': isSelected }>

  <div class="cell { opts.scene.color }{ opts.scene.isHidden ? ' is-hidden' : '' }" 
onclick= { onClickDestination}
>

    <button type="button"
            onclick={ onClickDestroyOption }
            if={ opts.option !== 'START' }
            class="btn btn-circle btn-remove">
    </button>

    <div class="option "
         onclick={ onClickEditOption }>
      { opts.option }
    </div>

    <div class="title {opts.type}"
         onclick={ onClickEditScene }>
      { opts.scene.card.title }
    </div>

    <button type="button"
            if={ opts.type !== 'virtual' }
            onclick={ onClickAddOption }
            class="btn btn-circle btn-add">
    </button>

    <button type="button"
            if={ opts.type !== 'virtual' }
            onclick={ onClickLinkOption }
            class="btn btn-circle btn-link">
    </button>

  </div>

  <div class="row"
       if={ children.length && opts.type !== 'virtual'  }>
    <scene each={ children }
           scene={ scene }
           scenes={ scenes }
           option={ option }
           type={ type } ></scene>
  </div>

  <script type="es6">

    this.children = []
    this.isSelected = false


    this.on('update', x => {
      if ( ! opts.scene ) return
      if ( opts.type == 'virtual' ) return

      this.isSelected = false
      this.children = opts.scene.options.map( option => {
        return {
          scene: opts.scenes.find( scene => scene.id === option.sceneId ),
          option: option.utterances[0],
          scenes: opts.scenes,
          type: option.type,
        }
      })

      var currentSceneId
      var hash = location.hash.split('/')

      try {
        if ( hash[ 1 ] && hash[ 1 ].indexOf('scene') === 0 ) {
          if ( hash[ 2 ] && hash[ 2 ].indexOf('option') === 0 ) {
            var parentScene = opts.scenes.find( scene => scene.id === Number( hash[ 1 ].split(':').pop() ) )
            var option = parentScene.options[ Number( hash[ 2 ].split(':').pop() ) ]
            currentSceneId = option ? option.sceneId : null
          }
          else {
            currentSceneId = Number( hash[ 1 ].split(':').pop() )
          }
        }
      }
      catch ( error ) { console.log( error ) }

      if ( opts.scene.id === currentSceneId ) {
        this.isSelected = true
      }

    })

    this.onClickDestroyOption = e => {
      e.stopPropagation()
          if (opts.type == 'virtual') { 
          } else {
              removeScene( e.item.scene )
          } 
      var options = this.parent.opts.scene.options
      var index = options.findIndex( option => option.sceneId === e.item.scene.id )
      options.splice( index, 1 )
      riot.route('/')
    }

    this.onClickEditOption = e => {
    if (!window.isLinking) {
      e.stopPropagation()
      if ( ! this.scene && opts.scene ) {
        riot.route('/scene:START/card')
      } else {
        var index = this.parent.children.indexOf( e.item )
        riot.route('/scene:' + this.parent.opts.scene.id + '/option:' + index )
      }
    }
}

    this.onClickEditScene = e => {
    if (!window.isLinking) {
      e.stopPropagation()
      riot.route('/scene:' + opts.scene.id + '/card')
    }
}


this.onClickLinkOption = e => {

    if (!window.isLinking) {
        e.stopPropagation()
            window.linkingSourceId = e.item.scene.id;
        window.isLinking = true;
        console.log("clicking source id",window.linkingSourceId);
        console.log("parent is",parent);
        console.log("islinking state",window.isLinking);
        dispatchEvent(new Event('start_link'));
    }

}

this.onClickDestination = e => {

      e.stopPropagation()

    console.log("dest islinking state",window.isLinking);
    if (window.isLinking) {
        destinationSceneId = e.item.scene.id;
        console.log("destination source id",destinationSceneId);
        console.log("to source id",window.linkingSourceId);

        //var parentSceneId = opts.scene ? opts.scene.id : 0;
        //var parentScene = opts.scenes.find( scene => scene.id === Number( parentSceneId ) )


        var sourceScene = opts.scenes.find( scene => scene.id === Number( window.linkingSourceId ) )
        var destinationScene = opts.scenes.find( scene => scene.id === Number( destinationSceneId ) )

        var option = {
            sceneId: destinationSceneId,
            utterances: [
                'open door'
            ],
            type: 'virtual'
        }

        sourceScene.options.push( option )

        dispatchEvent(new Event('stop_link'));
        window.isLinking = false;
    }

}


    this.onClickAddOption = e => {
      e.stopPropagation()
      var parentSceneId = opts.scene ? opts.scene.id : 0
      var sceneId = 0; while ( opts.scenes.find( scene => scene.id === sceneId ) ) { sceneId++ }
      var parentScene = opts.scenes.find( scene => scene.id === Number( parentSceneId ) )

      var option = {
        sceneId,
        utterances: [
          'open door'
        ]
      }

      var scene = {
        id: sceneId,
        color: 'default',
        isHidden: false,
        isEndScene: false,
        defaultOption: -1,
        generateOptions: true,
        readPreviousOptions: false,
        card: {
          title: 'Room',
          text: 'You enter a room.',
          image: {
            smallImageUrl: null,
            largeImageUrl: null
          }
        },
        voice: {
          intro: 'You enter a room. What would you like to do?',
          prompt: ''
        },
        options: []
      }

      parentScene.options.push( option )
      opts.scenes.push( scene )

      riot.route('/scene:' + parentScene.id + '/option:' + ( parentScene.options.length -1 ) )
    }


    function removeScene ( scene ) {
      if ( ! scene ) return // exit

      var sceneId = scene.id
      var index = opts.scenes.findIndex( scene => scene.id === sceneId )
      if ( index > -1 ) {
        opts.scenes.splice( index, 1 )
      }

      // remove option scenes
      scene.options.forEach( option => {
        scene = opts.scenes.find( scene => scene.id === option.sceneId )
        removeScene( scene )
      })
    }

  </script>
</scene>
