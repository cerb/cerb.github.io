* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
&lt;extension point=&quot;cerb.card.widget&quot;&gt;
    &lt;id&gt;example.card.widget&lt;/id&gt;
    &lt;name&gt;Card Widget&lt;/name&gt;
    &lt;class&gt;
        &lt;file&gt;api/widgets/cards/example.php&lt;/file&gt;
        &lt;name&gt;CardWidget_Example&lt;/name&gt;
    &lt;/class&gt;
    &lt;params&gt;
    &lt;/params&gt;
&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class CardWidget_Example extends Extension_CardWidget {
    function render(Model_CardWidget $model, $context, $context_id) {
    }
    
    function renderConfig(Model_CardWidget $model) {
    }
    
    function invokeConfig($action, Model_CardWidget $model) {
    }
    
    function saveConfig(array $fields, $id, &$error=null) {
    }
	
	public function export(Model_CardWidget $widget) {
	}
}
{% endraw %}
</code>
</pre>