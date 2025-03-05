* TOC
{:toc}

# Manifest

{% highlight xml %}
<extension point=&quot;cerb.card.widget&quot;>
    <id>example.card.widget</id>
    <name>Card Widget</name>
    <class>
        <file>api/widgets/cards/example.php</file>
        <name>CardWidget_Example</name>
    </class>
    <params>
    </params>
</extension>
{% endhighlight %}

# Code

{% highlight php %}
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
{% endhighlight %}