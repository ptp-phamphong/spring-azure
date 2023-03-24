/*!
 * parallax.js v1.4.2 (http://pixelcog.github.io/parallax.js/)
 * @copyright 2016 PixelCog, Inc.
 * @license MIT (https://github.com/pixelcog/parallax.js/blob/master/LICENSE)
 */
!function(i){"use strict";"function"==typeof define&&define.amd?define(["jquery"],i):"undefined"!=typeof exports?module.exports=i(require("jquery")):i(jQuery)}(function(i){function t(e,s){var o=this;"object"==typeof s&&(delete s.refresh,delete s.render,i.extend(this,s)),this.$element=i(e),!this.imageSrc&&this.$element.is("img")&&(this.imageSrc=this.$element.attr("src"));var h=(this.position+"").toLowerCase().match(/\S+/g)||[];if(h.length<1&&h.push("center"),1==h.length&&h.push(h[0]),("top"==h[0]||"bottom"==h[0]||"left"==h[1]||"right"==h[1])&&(h=[h[1],h[0]]),void 0!=this.positionX&&(h[0]=this.positionX.toLowerCase()),void 0!=this.positionY&&(h[1]=this.positionY.toLowerCase()),o.positionX=h[0],o.positionY=h[1],"left"!=this.positionX&&"right"!=this.positionX&&(isNaN(parseInt(this.positionX))?this.positionX="center":this.positionX=parseInt(this.positionX)),"top"!=this.positionY&&"bottom"!=this.positionY&&(isNaN(parseInt(this.positionY))?this.positionY="center":this.positionY=parseInt(this.positionY)),this.position=this.positionX+(isNaN(this.positionX)?"":"px")+" "+this.positionY+(isNaN(this.positionY)?"":"px"),navigator.userAgent.match(/(iPod|iPhone|iPad)/))return this.imageSrc&&this.iosFix&&!this.$element.is("img")&&this.$element.css({backgroundImage:"url("+this.imageSrc+")",backgroundSize:"cover",backgroundPosition:this.position}),this;if(navigator.userAgent.match(/(Android)/))return this.imageSrc&&this.androidFix&&!this.$element.is("img")&&this.$element.css({backgroundImage:"url("+this.imageSrc+")",backgroundSize:"cover",backgroundPosition:this.position}),this;this.$mirror=i("<div />").prependTo("body");var r=this.$element.find(">.parallax-slider"),n=!1;0==r.length?this.$slider=i("<img />").prependTo(this.$mirror):(this.$slider=r.prependTo(this.$mirror),n=!0),this.$mirror.addClass("parallax-mirror").css({visibility:"hidden",zIndex:this.zIndex,position:"fixed",top:0,left:0,overflow:"hidden"}),this.$slider.addClass("parallax-slider").one("load",function(){o.naturalHeight&&o.naturalWidth||(o.naturalHeight=this.naturalHeight||this.height||1,o.naturalWidth=this.naturalWidth||this.width||1),o.aspectRatio=o.naturalWidth/o.naturalHeight,t.isSetup||t.setup(),t.sliders.push(o),t.isFresh=!1,t.requestRender()}),n||(this.$slider[0].src=this.imageSrc),(this.naturalHeight&&this.naturalWidth||this.$slider[0].complete||r.length>0)&&this.$slider.trigger("load")}function e(e){return this.each(function(){var s=i(this),o="object"==typeof e&&e;this==window||this==document||s.is("body")?t.configure(o):s.data("px.parallax")?"object"==typeof e&&i.extend(s.data("px.parallax"),o):(o=i.extend({},s.data(),o),s.data("px.parallax",new t(this,o))),"string"==typeof e&&("destroy"==e?t.destroy(this):t[e]())})}!function(){for(var i=0,t=["ms","moz","webkit","o"],e=0;e<t.length&&!window.requestAnimationFrame;++e)window.requestAnimationFrame=window[t[e]+"RequestAnimationFrame"],window.cancelAnimationFrame=window[t[e]+"CancelAnimationFrame"]||window[t[e]+"CancelRequestAnimationFrame"];window.requestAnimationFrame||(window.requestAnimationFrame=function(t){var e=(new Date).getTime(),s=Math.max(0,16-(e-i)),o=window.setTimeout(function(){t(e+s)},s);return i=e+s,o}),window.cancelAnimationFrame||(window.cancelAnimationFrame=function(i){clearTimeout(i)})}(),i.extend(t.prototype,{speed:.2,bleed:0,zIndex:-100,iosFix:!0,androidFix:!0,position:"center",overScrollFix:!1,refresh:function(){this.boxWidth=this.$element.outerWidth(),this.boxHeight=this.$element.outerHeight()+2*this.bleed,this.boxOffsetTop=this.$element.offset().top-this.bleed,this.boxOffsetLeft=this.$element.offset().left,this.boxOffsetBottom=this.boxOffsetTop+this.boxHeight;var i=t.winHeight,e=t.docHeight,s=Math.min(this.boxOffsetTop,e-i),o=Math.max(this.boxOffsetTop+this.boxHeight-i,0),h=this.boxHeight+(s-o)*(1-this.speed)|0,r=(this.boxOffsetTop-s)*(1-this.speed)|0;if(h*this.aspectRatio>=this.boxWidth){this.imageWidth=h*this.aspectRatio|0,this.imageHeight=h,this.offsetBaseTop=r;var n=this.imageWidth-this.boxWidth;"left"==this.positionX?this.offsetLeft=0:"right"==this.positionX?this.offsetLeft=-n:isNaN(this.positionX)?this.offsetLeft=-n/2|0:this.offsetLeft=Math.max(this.positionX,-n)}else{this.imageWidth=this.boxWidth,this.imageHeight=this.boxWidth/this.aspectRatio|0,this.offsetLeft=0;var n=this.imageHeight-h;"top"==this.positionY?this.offsetBaseTop=r:"bottom"==this.positionY?this.offsetBaseTop=r-n:isNaN(this.positionY)?this.offsetBaseTop=r-n/2|0:this.offsetBaseTop=r+Math.max(this.positionY,-n)}},render:function(){var i=t.scrollTop,e=t.scrollLeft,s=this.overScrollFix?t.overScroll:0,o=i+t.winHeight;this.boxOffsetBottom>i&&this.boxOffsetTop<=o?(this.visibility="visible",this.mirrorTop=this.boxOffsetTop-i,this.mirrorLeft=this.boxOffsetLeft-e,this.offsetTop=this.offsetBaseTop-this.mirrorTop*(1-this.speed)):this.visibility="hidden",this.$mirror.css({transform:"translate3d(0px, 0px, 0px)",visibility:this.visibility,top:this.mirrorTop-s,left:this.mirrorLeft,height:this.boxHeight,width:this.boxWidth}),this.$slider.css({transform:"translate3d(0px, 0px, 0px)",position:"absolute",top:this.offsetTop,left:this.offsetLeft,height:this.imageHeight,width:this.imageWidth,maxWidth:"none"})}}),i.extend(t,{scrollTop:0,scrollLeft:0,winHeight:0,winWidth:0,docHeight:1<<30,docWidth:1<<30,sliders:[],isReady:!1,isFresh:!1,isBusy:!1,setup:function(){if(!this.isReady){var e=i(document),s=i(window),o=function(){t.winHeight=s.height(),t.winWidth=s.width(),t.docHeight=e.height(),t.docWidth=e.width()},h=function(){var i=s.scrollTop(),e=t.docHeight-t.winHeight,o=t.docWidth-t.winWidth;t.scrollTop=Math.max(0,Math.min(e,i)),t.scrollLeft=Math.max(0,Math.min(o,s.scrollLeft())),t.overScroll=Math.max(i-e,Math.min(i,0))};s.on("resize.px.parallax load.px.parallax",function(){o(),t.isFresh=!1,t.requestRender()}).on("scroll.px.parallax load.px.parallax",function(){h(),t.requestRender()}),o(),h(),this.isReady=!0}},configure:function(t){"object"==typeof t&&(delete t.refresh,delete t.render,i.extend(this.prototype,t))},refresh:function(){i.each(this.sliders,function(){this.refresh()}),this.isFresh=!0},render:function(){this.isFresh||this.refresh(),i.each(this.sliders,function(){this.render()})},requestRender:function(){var i=this;this.isBusy||(this.isBusy=!0,window.requestAnimationFrame(function(){i.render(),i.isBusy=!1}))},destroy:function(e){var s,o=i(e).data("px.parallax");for(o.$mirror.remove(),s=0;s<this.sliders.length;s+=1)this.sliders[s]==o&&this.sliders.splice(s,1);i(e).data("px.parallax",!1),0===this.sliders.length&&(i(window).off("scroll.px.parallax resize.px.parallax load.px.parallax"),this.isReady=!1,t.isSetup=!1)}});var s=i.fn.parallax;i.fn.parallax=e,i.fn.parallax.Constructor=t,i.fn.parallax.noConflict=function(){return i.fn.parallax=s,this},i(document).on("ready.px.parallax.data-api",function(){i('[data-parallax="scroll"]').parallax()})});