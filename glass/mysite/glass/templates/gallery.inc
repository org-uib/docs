						<ul id="gallery" style="margin-top:10px">
						    {% for photo in object_list %}
						    <li title="{{photo.title}}"
						    style="background-image:url({{photo.get_thumbnail_url}}); background-repeat:no-repeat;")
						    >
						        <img src="{{photo.get_display_url}}">
							<div id="textbox{{forloop.counter0}}" class="textbox">
							    <br/><span style="line-height: 16px;">
							    {{photo.caption|safe}}
							    </span>
							    <br/>
							</div>
						    </li>
						    {% endfor %}
						</ul>
