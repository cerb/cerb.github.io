# Manifest

{% highlight xml %}
		<extension point=&quot;cerb.connected_service.provider&quot;>
			<id>cerb.service.provider.aws</id>
			<name>Amazon Web Services</name>
			<class>
				<file>api/service_providers/aws.php</file>
				<name>ServiceProvider_Aws</name>
			</class>
			<params>
				<param key=&quot;options&quot;>
					<value>
						<data key=&quot;accounts&quot;/>
					</value>
				</param>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
class ExampleExtension extends Extension_ConnectedServiceProvider {
	public function ajaxAction()

	public function authenticateHttpRequest(Model_ConnectedAccount $account, Psr\Http\Message\RequestInterface $request, array $options)

	public function renderAccountConfigForm(Model_ConnectedService $service, Model_ConnectedAccount $account)

	public function renderConfigForm(Model_ConnectedService $service)

	public function saveAccountConfigForm(Model_ConnectedService $service, Model_ConnectedAccount $account, array $params, $error)

	public function saveConfigForm(Model_ConnectedService $service, array $params, $error)

}
{% endhighlight %}

