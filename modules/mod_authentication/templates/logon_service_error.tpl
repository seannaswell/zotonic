{% extends "base_simple.tpl" %}

{# Template shown in popup window when redirecting to an external identity service #}

{% block title %}{_ Error _}{% endblock %}

{% block content %}
	{% if error == `email_required` %}
		<div class="container">
			<h1>{_ Sorry _}</h1>

			<p>{_ You have to share your email address to be able to log on. _}</p>

			{% if auth_link %}
				<p><a href="{{ auth_link }}">{_ Change your permissions _}</a></p>
			{% endif %}
		</div>
	{% elseif error == `cancel` %}
		{% javascript %}
			window.close();
		{% endjavascript %}
	{% elseif error == `duplicate` %}
		<div class="container">
			<h1>{_ Already Connected _}</h1>

			<p class="alert">{_ Somebody else is already connected with this account on _} {{ service }}</p>
		</div>
	{% else %}
		<div class="container">
			<h1>{_ Sorry _}</h1>

			<p class="alert alert-danger">{_ There was a problem authenticating with _} {{ service }}</p>

			<p>{_ Please try again later. _}</p>
		</div>
	{% endif %}

	<p>
		{% button class="btn" action={script script="window.close();"} text=_"Close Window" %}
	</p>
{% endblock %}
