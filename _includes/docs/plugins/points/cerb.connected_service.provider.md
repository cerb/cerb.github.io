# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerb.connected_service.provider&quot;&gt;
			&lt;id&gt;cerb.service.provider.aws&lt;/id&gt;
			&lt;name&gt;Amazon Web Services&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/service_providers/aws.php&lt;/file&gt;
				&lt;name&gt;ServiceProvider_Aws&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;options&quot;&gt;
					&lt;value&gt;
						&lt;data key=&quot;accounts&quot;/&gt;
					&lt;/value&gt;
				&lt;/param&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
class ExampleExtension extends Extension_ConnectedServiceProvider {
	public function ajaxAction()

	public function authenticateHttpRequest(Model_ConnectedAccount $account, Psr\Http\Message\RequestInterface $request, array $options)

	public function renderAccountConfigForm(Model_ConnectedService $service, Model_ConnectedAccount $account)

	public function renderConfigForm(Model_ConnectedService $service)

	public function saveAccountConfigForm(Model_ConnectedService $service, Model_ConnectedAccount $account, array $params, $error)

	public function saveConfigForm(Model_ConnectedService $service, array $params, $error)

}
</code>
</pre>

