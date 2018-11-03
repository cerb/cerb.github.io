* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerb.custom_field&quot;&gt;
			&lt;id&gt;example.plugin.custom_field&lt;/id&gt;
			&lt;name&gt;Example Custom Field Type&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;CustomField_Example&lt;/name&gt;
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
class CustomField_Example extends Extension_CustomField {
	const ID = 'example.plugin.custom_field';
	
	function renderEditable(Model_CustomField $field, $form_key, $form_value) {
		$tpl = DevblocksPlatform::services()->template();
		
		$tpl->assign('field', $field);
		$tpl->assign('form_key', $form_key);
		
		$form_value = $this->getValue($form_value);
		$tpl->assign('form_value', $form_value);
		
		$tpl->display('devblocks:example.plugin::custom_fields/editors/example.tpl');
	}
	
	function validationRegister(Model_CustomField $field, _DevblocksValidationService &$validation) {
		$validation
			->addField($field->id, $field->name)
			->string()
		;
	}
	
	function formatFieldValue($value) {
		return $value;
	}
	
	function setFieldValue(Model_CustomField $field, $context, $context_id, $value) {
		$db = DevblocksPlatform::services()->database();
		
		self::unsetFieldValue($field, $context, $context_id, $value);
		
		$table = $this->getValueTableName();
		
		$sql = sprintf("INSERT INTO %s (field_id, context, context_id, field_value) ".
			"VALUES (%d, %s, %d, POINT(%f,%f))",
			$db->escape($table),
			$field->id,
			$db->qstr($context),
			$context_id,
			$coords['longitude'],
			$coords['latitude']
		);
		$db->ExecuteMaster($sql);
		
		DevblocksPlatform::markContextChanged($context, $context_id);
	}
	
	function unsetFieldValue(Model_CustomField $field, $context, $context_id, $value=null) {
		$db = DevblocksPlatform::services()->database();
		
		$table = $this->getValueTableName();
		
		$sql = sprintf("DELETE FROM %s WHERE field_id = %d AND context = %s AND context_id = %d",
			$db->escape($table),
			$field->id,
			$db->qstr($context),
			$context_id
		);
		$db->ExecuteMaster($sql);
		
		DevblocksPlatform::markContextChanged($context, $context_id);
	}
	
	function getValue($value) {
		// [TODO] Transform as needed
		return $value;
	}
	
	function renderValue($value) {
		// [TODO] This is what you see on cards, profiles, and worklists
		$value = $this->getValue($value);
		echo htmlentities($value);
	}
	
	function prepareCriteriaParam(Model_CustomField $field, $param, &$vals, &$implode_token) {
		$implode_token = ', ';
		return true;
	}

	function populateQuickSearchMeta(array &$search_field_meta) {
		$search_field_meta['type'] = DevblocksSearchCriteria::TYPE_STRING;
		return true;
	}
	
	function getValueTableName() {
		return 'custom_field_stringvalue';
	}
	
	function getValueTableSql($context, array $context_ids) {
		$table = $this->getValueTableName();
		
		return sprintf("SELECT context_id, field_id, ST_ASTEXT(field_value) AS field_value ".
			"FROM %s ".
			"WHERE context = '%s' AND context_id IN (%s)",
			$db->escape($table),
			$context,
			implode(',', $context_ids)
		);
	}
}
{% endraw %}
</code>
</pre>

