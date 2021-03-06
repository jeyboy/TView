/*
Stylish Select 0.4.1 - $ plugin to replace a select drop down box with a stylable unordered list
http://scottdarby.com/

Requires: jQuery 1.3 or newer

Contributions from Justin Beasley: http://www.harvest.org/ & Anatoly Ressin: http://www.artazor.lv/

Dual licensed under the MIT and GPL licenses.

*/
(function($){
	//add class to html tag
	$('html').addClass('stylish-select');

	//create cross-browser indexOf
	Array.prototype.indexOf = function (obj, start) {
		for (var i = (start || 0); i < this.length; i++) {
			if (this[i] == obj) {
				return i;
			}
		}
	}

	//utility methods
	$.fn.extend({
		getSetSSValue: function(value){
			if (value){
				//set value and trigger change event
				$(this).val(value).change();
				return this;
			} else {
				return $(this).find(':selected').val();
			}
		},
		//added by Justin Beasley
		resetSS: function(){
			var oldOpts = $(this).data('ssOpts');
			$this = $(this);
			$this.next().remove();
			//unbind all events and redraw
			$this.unbind('.sSelect').sSelect(oldOpts);
		}
	});

	$.fn.sSelect = function(options) {

		return this.each(function(){

		var defaults = {
			defaultText: 'Please select',
			animationSpeed: 0, //set speed of dropdown
			ddMaxHeight: '' //set css max-height value of dropdown
		};

		//initial variables
		var opts = $.extend(defaults, options),
		$input = $(this),
		$containerDivText = $('<div class="selectedTxt"></div>'),
		$containerDiv = $('<div class="newListSelected" tabindex="0"></div>'),
		$newUl = $('<ul class="newList"></ul>'),
		itemIndex = -1,
		currentIndex = -1,
		keys = [],
		prevKey = false,
		prevented = false,
		$newLi;

		//added by Justin Beasley
		$(this).data('ssOpts',options);

		//build new list
		$containerDiv.insertAfter($input);
		$containerDivText.prependTo($containerDiv);
		$newUl.appendTo($containerDiv);
		$input.hide();

		//added by Justin Beasley (used for lists initialized while hidden)
		$containerDivText.data('ssReRender',!$containerDivText.is(':visible'));

            //test for optgroup
            if ($input.children('optgroup').length == 0){
                $input.children().each(function(i){
                    var option = $(this).text();
                    var key = $(this).val();

                    //add first letter of each word to array
                    keys.push(option.charAt(0).toLowerCase());
                    if ($(this).attr('selected') == true){
                        opts.defaultText = option;
                        currentIndex = i;
                    }
                    $newUl.append($('<li><a href="JavaScript:void(0);">'+option+'</a></li>').data('key', key));

                });
                //cache list items object
                $newLi = $newUl.children().children();

            } else { //optgroup
                $input.children('optgroup').each(function(){

                    var optionTitle = $(this).attr('label'),
                    $optGroup = $('<li class="newListOptionTitle">'+optionTitle+'</li>');

                    $optGroup.appendTo($newUl);

                    var $optGroupList = $('<ul></ul>');

                    $optGroupList.appendTo($optGroup);

                    $(this).children().each(function(){
                        ++itemIndex;
                        var option = $(this).text();
                        var key = $(this).val();
                        //add first letter of each word to array
                        keys.push(option.charAt(0).toLowerCase());
                        if ($(this).attr('selected') == true){
                            opts.defaultText = option;
                            currentIndex = itemIndex;
                        }
                        $optGroupList.append($('<li><a href="JavaScript:void(0);">'+option+'</a></li>').data('key',key));
                    })
                });
                //cache list items object
                $newLi = $newUl.find('ul li a');
            }

            //get heights of new elements for use later
            var newUlHeight = $newUl.height(),
            containerHeight = $containerDiv.height(),
            newLiLength = $newLi.length;

            //check if a value is selected
            if (currentIndex != -1){
                navigateList(currentIndex, true);
            } else {
                //set placeholder text
                $containerDivText.text(opts.defaultText);
            }

            //decide if to place the new list above or below the drop-down
            function newUlPos(){
                var containerPosY = $containerDiv.offset().top,
                docHeight = jQuery(window).height(),
                scrollTop = jQuery(window).scrollTop();

                //if height of list is greater then max height, set list height to max height value
                if (newUlHeight > parseInt(opts.ddMaxHeight)) {
                    newUlHeight = parseInt(opts.ddMaxHeight);
                }

                containerPosY = containerPosY-scrollTop;
                if (containerPosY+newUlHeight >= docHeight){
                    $newUl.css({
                       // top: '-'+newUlHeight+'px',
                        //height: newUlHeight
                    });
                    $input.onTop = false;
                } else {
                    $newUl.css({
                        top: containerHeight+'px'
                        //height: newUlHeight
                    });
                    $input.onTop = false;
                }
            }

            //run function on page load
            newUlPos();

            //run function on browser window resize
            $(window).bind('resize.sSelect',function(){
                newUlPos();
            });

            $(window).bind('scroll.sSelect',function(){
                newUlPos();
            });

						
			function _hideShow( $ul , show)
			{
				var $div = $ul.parent();
				if (show)
				{
					$div.css('position','relative');	
					$ul.show();
				}
				else
				{
					$div.css('position','static');
					$ul.hide();
				}
			}
			
			function showMenu()
			{
				 //hide all menus apart from this one
				var $etc = $('.newList').not($(this).next());
				_hideShow($etc, false);
				$etc.parent().removeClass('newListSelFocus');
				//
				_hideShow($newUl, true);
			}
			
			function hideMenu()
			{
				_hideShow($newUl, false);
			}
			
            $containerDivText.bind('click.sSelect',function(event){
                event.stopPropagation();

				//added by Justin Beasley
				if($(this).data('ssReRender')) {
					newUlHeight = $newUl.height('').height();
					containerHeight = $containerDiv.height();
					$(this).data('ssReRender',false);
					newUlPos();
				}
				
            	if ($newUl.is(':visible')) { hideMenu(); }
				else {	showMenu();		}
			   
			    //scroll list to selected item
                $newLi.eq(currentIndex).focus();

            });

            $newLi.bind('click.sSelect',function(e){
                var $clickedLi = $(e.target);

                //update counter
                currentIndex = $newLi.index($clickedLi);

                //remove all hilites, then add hilite to selected item
                prevented = true;
                navigateList(currentIndex);
                
				hideMenu();
				//$newUl.hide();
				//positionHideFix();

            });

            $newLi.bind('mouseenter.sSelect',
				function(e) {
					var $hoveredLi = $(e.target);
					$hoveredLi.addClass('newListHover');
				}
			).bind('mouseleave.sSelect',
				function(e) {
					var $hoveredLi = $(e.target);
					$hoveredLi.removeClass('newListHover');
				}
			);

            function navigateList(currentIndex, init){
                $newLi.removeClass('hiLite')
                .eq(currentIndex)
                .addClass('hiLite');
                if ($newUl.is(':visible')){
                    $newLi.eq(currentIndex).focus();
                }

                var text = $newLi.eq(currentIndex).text();
                var val = $newLi.eq(currentIndex).parent().data('key');

                //page load
                if (init == true){
                    $input.val(val);
                    $containerDivText.text(text);
                    return false;
                }

                $input.val(val)
                $input.change();
                $containerDivText.text(text);
            };

            $input.bind('change.sSelect',function(event){
                $targetInput = $(event.target);
                //stop change function from firing
                if (prevented == true){
                    prevented = false;
                    return false;
                }
                $currentOpt = $targetInput.find(':selected');

                //currentIndex = $targetInput.find('option').index($currentOpt);
                currentIndex = $targetInput.find('option').index($currentOpt);

                navigateList(currentIndex, true);
			});

            //handle up and down keys
            function keyPress(element) {
                //when keys are pressed
                $(element).unbind('keydown.sSelect').bind('keydown.sSelect',function(e){
                    var keycode = e.which;

                    //prevent change function from firing
                    prevented = true;

                    switch(keycode) {
                        case 40: //down
                        case 39: //right
                            incrementList();
                            return false;
                            break;
                        case 38: //up
                        case 37: //left
                            decrementList();
                            return false;
                            break;
                        case 33: //page up
                        case 36: //home
                            gotoFirst();
                            return false;
                            break;
                        case 34: //page down
                        case 35: //end
                            gotoLast();
                            return false;
                            break;
                        case 13:
                        case 27:
                          //  $newUl.hide();
                           // positionHideFix();
						   hideMenu();
                            return false;
                            break;
                    }

                    //check for keyboard shortcuts
                    keyPressed = String.fromCharCode(keycode).toLowerCase();

                    var currentKeyIndex = keys.indexOf(keyPressed);

                    if (typeof currentKeyIndex != 'undefined') { //if key code found in array
                        ++currentIndex;
                        currentIndex = keys.indexOf(keyPressed, currentIndex); //search array from current index
                        if (currentIndex == -1 || currentIndex == null || prevKey != keyPressed) currentIndex = keys.indexOf(keyPressed); //if no entry was found or new key pressed search from start of array


                        navigateList(currentIndex);
                        //store last key pressed
                        prevKey = keyPressed;
                        return false;
                    }
                });
            }

            function incrementList(){
                if (currentIndex < (newLiLength-1)) {
                    ++currentIndex;
                    navigateList(currentIndex);
                }
            }

            function decrementList(){
                if (currentIndex > 0) {
                    --currentIndex;
                    navigateList(currentIndex);
                }
            }

            function gotoFirst(){
                currentIndex = 0;
                navigateList(currentIndex);
            }

            function gotoLast(){
                currentIndex = newLiLength-1;
                navigateList(currentIndex);
            }

            $containerDiv.bind('click.sSelect',function(){
                keyPress(this);
            });

            $containerDiv.bind('focus.sSelect',function(){
                $(this).addClass('newListSelFocus');
                keyPress(this);
            });

            $containerDiv.bind('blur.sSelect',function(){
                $(this).removeClass('newListSelFocus');
            });

            //hide list on blur
            $('body').bind('click.sSelect',function(){
                $containerDiv.removeClass('newListSelFocus');
				hideMenu();
            });

            //add classes on hover
            $containerDivText.bind('mouseenter.sSelect',
				function(e) {
					var $hoveredTxt = $(e.target);
					$hoveredTxt.parent().addClass('newListSelHover');
				}
			).bind('mouseleave.sSelect',
				function(e) {
					var $hoveredTxt = $(e.target);
					$hoveredTxt.parent().removeClass('newListSelHover');
				}
            );
			
			hideMenu();
			$newUl.css('left','0');
            /**
             * Adaptive size by diablitozzz@gmail.com
             */
			var adaptiveSize_CloneWithCss = function( obj )
			{
				var attr = [
					"padding-left", 
					"padding-right",
					"padding-bottom",
					"padding-top",
					"margin-top",
					"margin-bottom",
					"margin-left",
					"margin-right",
					"font-size",
					"font-style",
					"font-variant",
					"font-weight",
					"font-family",
					"font",
					"line-height",
					"text-align",
					"text-decoration",
					"text-indent",
					"text-transform"
					];
				var out = obj.clone();
				for (var i=0; i<attr.length;i++)
				{
					var at = attr[i];
					
					out.css(at, obj.css(at));
				}
				return out;
			};
			var getC = function( o, key )
			{
				var val = parseInt( o.css(key).replace('px','')   );
				return (!val) ? 0 : val;				
			};
			var getAdaptiveWidth = function($ul)
			{
			   	var sizes = new Array();
				$ul.find("a").each(function(){
					var $o = adaptiveSize_CloneWithCss( $(this) );  
					$o.hide();	
					$('body').append($o);
					$o.css('white-space','nowrap');
					var width = $o.width()+ getC($o, "margin-left")+ getC($o, "margin-right");
					sizes.push(width);
					$o.remove();
            	});
				return Math.max.apply(Math, sizes);
			};
	        var adaptiveSize = function ($self, $select)
            {
				var $ul = $self.find("ul");
				var $div = $self.find("div");
				var width = $select.width();
				if ( $select.css('width')=='auto'  )
				{
					width = getAdaptiveWidth($ul);
				}
				width = width+
					getC($div, "margin-left")+
					getC($div, "margin-right")+
					getC($div, "padding-left")+
					getC($div, "padding-right");
				var parentWidth = $self.parent().innerWidth()-
					getC($self, "border-left-width")-
					getC($self, "border-right-width");		
					
				if (parentWidth<width)// set max size
				{						
					width = parentWidth;
					$self.css('margin-right',0);
				}
				$self.width(width);
				$ul.width(width);
				$div.height(
					$self.height() -
					getC($div, "padding-top")-
					getC($div, "padding-bottom")-
					getC($div, "margin-top")-
					getC($div, "margin-bottom")-
					getC($self,"border-top-width")-
					getC($self,"border-bottom-width")
				);
				$div.width(
					width -
					getC($div, "padding-left")-
					getC($div, "padding-right")-	
					getC($div, "border-left-width")-
					getC($div, "border-right-width")
				);
            };

			adaptiveSize($containerDiv, $(this));		
			/*
			 * End adaptive size
			 */
        });
		
    };

})(jQuery);