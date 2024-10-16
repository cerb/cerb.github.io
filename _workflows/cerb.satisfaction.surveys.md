---
title: Customer Satisfaction Surveys
excerpt: Gather and monitor customer satisfaction metrics like NPS, CSAT, and CES.
layout: integration
topic: Workflows
permalink: /workflows/cerb.satisfaction.surveys/
redirect_from:
  - /packages/customer-satisfaction/
jumbotron:
  title: Customer Satisfaction Surveys
  tagline: ""
  breadcrumbs:
  -
    label: Resources &raquo;
    url: /resources/
  -
    label: Workflows &raquo;
    url: /resources/workflows/
---

* TOC
{:toc}

# Introduction

This workflow adds three custom records for tracking customer satisfaction metrics, a set of automations, a workspace with reporting widgets, and a community portal for gathering survey responses.

The following metrics are tracked:

- **Net Promoter Score (NPS)** - per contact, how likely your clients are to recommend your product/service to their friends and colleagues.
- **Customer Satisfaction (CSAT)** - at each response, how satisfied a client was with the interaction.
- **Customer Effort Score (CES)** - at resolution, how satisfied a client was with the entire process of resolving their issue.

# Installation

This workflow is built into Cerb [11.0+](/releases/11.0/). It will automatically update.

You can enable it from **Search >> Workflows >> (+) >> Customer Satisfaction Surveys**.

# Testing an NPS survey

Navigate to **Search >> Workspace Pages** and click on **Satisfaction**.

On the **NPS** tab, click the **Create NPS survey link** button.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/satisfaction/create-nps-survey-link.png" class="screenshot">
</div>

Select an email address and click the **Continue** button.

Copy or click on the survey link to test the survey interaction.

<div class="cerb-screenshot">
<img src="/assets/images/workflows/satisfaction/survey-nps.png" class="screenshot">
</div>

Select a rating, optionally add a comment, and then click the blue continue button.

# Using the satisfaction dashboard

You should now have your first NPS rating.

Navigate back to **Search >> Workspace Pages >> Satisfaction**.

You should see your first NPS rating:

<div class="cerb-screenshot">
<img src="/assets/images/workflows/satisfaction/dashboard.png" class="screenshot">
</div>

# Broadcasting NPS survey links

Navigate to an email based worklist like **Search >> Contacts**. Filter the list as needed.

Click on the **bulk update** button below the worklist.

Check the **Send Broadcast** section.

In **To:** check **Contact email address**.

Enter a **Subject:** like:

<pre>
<code class="language-text">
{% raw %}
How likely are you to recommend Cerb to friends and colleagues?
{% endraw %}
</code>
</pre>

In **Compose:** enter a message with placeholders like:

<pre>
<code class="language-text">
{% raw %}
{% set inputs = { email: broadcast_email_address } -%}

Hi {{broadcast_email_address}},

We'd really appreciate your feedback on this two question survey about your experience with Cerb:
{{cerb_automation('cerb.satisfaction.surveys.nps.scriptingGetLink',inputs).return.signed_url}}

#signature
{% endraw %}
</code>
</pre>

# Reference

You can build your own customer satisfaction workflow using this template as a reference.

Change occurrences of **cerb.satisfaction.surveys** to your own workflow identifier. Use a prefix based on a domain you own (e.g. `com.example.workflow`).

<pre style="max-height: 29.25em;">
<code class="language-cerb">
{% raw %}
workflow:
  name: cerb.satisfaction.surveys
  version: 2024-10-15T00:00:00Z
  description: Gather and monitor customer satisfaction metrics like NPS, CSAT, and CES.
  requirements:
    cerb_version: >=11.0 <11.1
    cerb_plugins: cerberusweb.core, cerb.website.interactions
  config:
    text/portalTitle:
      default: Cerb - Customer Satisfaction
    picklist/surveysEnabled:
      label: Surveys Enabled:
      multiple@bool: yes
      default@csv: NPS
      options@csv: NPS, CSAT, CES
    text/npsQuestion:
      default: How likely are you to recommend Cerb to your friends and colleagues?
    text/npsCommentLabel:
      default: Why did you choose this rating? (optional)
    text/csatQuestion:
      default: How satisfied are you with the service you received?
    text/hashSecret:
      default: {{random_string(40)}}

records:
  custom_record/recordNps:
    fields:
      name: NPS Survey
      name_plural: NPS Surveys
      uri: nps_survey
      params:
        owners:
          contexts@csv: cerberusweb.contexts.app
  custom_field/recordNpsEmail:
    fields:
      name: Email
      uri: email
      context: nps_survey
      pos: 0
      type: L
      params:
        context: cerberusweb.contexts.address
  custom_field/recordNpsCohort:
    fields:
      name: Cohort
      uri: cohort
      context: nps_survey
      pos: 1
      type: D
      params:
        options@csv: Promoter, Passive, Detractor
  custom_field/recordNpsRating:
    fields:
      name: Rating
      uri: rating
      context: nps_survey
      pos: 2
      type: N
  custom_field/recordNpsComment:
    fields:
      name: Comment
      uri: comment
      context: nps_survey
      pos: 3
      type: T
  custom_record/recordCes:
    fields:
      name: CES Survey
      name_plural: CES Surveys
      uri: ces_survey
      params:
        owners:
          contexts@csv: cerberusweb.contexts.app
  custom_field/recordCesTicket:
    fields:
      name: Ticket
      context: ces_survey
      uri: ticket
      type: L
      params:
        context: cerberusweb.contexts.ticket
  custom_field/recordCesRating:
    fields:
      name: Rating
      context: ces_survey
      uri: rating
      type: N
  custom_field/recordCesComment:
    fields:
      name: Comment
      context: ces_survey
      uri: comment
      type: S
  custom_field/recordCesIp:
    fields:
      name: IP
      context: ces_survey
      uri: ip
      type: S
  custom_record/recordCsat:
    fields:
      name: CSAT Survey
      name_plural: CSAT Surveys
      uri: csat_survey
      params:
        owners:
          contexts@csv: cerberusweb.contexts.app
  custom_field/recordCsatMessage:
    fields:
      name: Message
      context: csat_survey
      uri: message
      type: L
        params:
          context: cerberusweb.contexts.message
  custom_field/recordCsatWorker:
    fields:
      name: Worker
      context: csat_survey
      uri: worker
      type: L
        params:
          context: cerberusweb.contexts.worker
  custom_field/recordCsatRating:
    fields:
      name: Rating
      context: csat_survey
      uri: rating
      type: N
  custom_field/recordCsatComment:
    fields:
      name: Comment
      context: csat_survey
      uri: comment
      type: S
  custom_field/recordCsatIp:
    fields:
      name: IP
      context: csat_survey
      uri: ip
      type: S

  workspace_page/satisfactionPage:
    fields:
      name: Satisfaction
      extension_id: core.workspace.page.workspace
      owner__context: workflow
      owner_id: {{workflow_id}}

  workspace_tab/satisfactionTabNps:
    fields:
      name: NPS
      page_id: {{records.satisfactionPage.id}}
      extension_id: core.workspace.tab.dashboard
      pos: 1
      params:
        layout: sidebar_left
      options_kata@raw:
        hidden@bool: {{'NPS' not in cerb_workflow_config('cerb.satisfaction.surveys','surveysEnabled')}}

  workspace_widget/npsWidgetScore:
    fields:
      label: NPS Score (90d)
      extension_id: core.workspace.widget.sheet
      tab_id: {{records.satisfactionTabNps.id}}
      pos: 1
      width_units: 4
      zone: sidebar
      params:
        data_query@raw:
          type:automation.invoke
          name:cerb.satisfaction.surveys.nps.dataQuery.score
          inputs:(
            date_range:"-90 days"
          )
          format:dictionaries
        cache_secs@text:
        placeholder_simulator_kata@text:
        sheet_kata@raw:
          layout:
            style: fieldsets
            headings@bool: no
            paging@bool: no
          columns:
            text/score:
              params:
                text_align: center
                text_size@raw: 500%
                value_template@raw: {{score}}
                bold@bool: yes
            slider/nps:
              params:
                show_labels@bool: yes
                text_align: center
                text_size@raw: 200%
                min: -100
                max: 100
                value_template@raw: {{score}}
                threshold_colors:
                  -100: #FF0000
                  -75: #FF9900
                  -25: #CCCCCC
                  25: #00AA00
                  75: #00FF00
            markdown/summary:
              params:
                value_template@raw:
                  |
                  |-:|-:|:-
                  | **Promoters:** | {{num_promoters}} / {{num_responses}} | {% if num_responses %}({{"%0.1f"|format(num_promoters/num_responses*100)}}%){% endif %}

                  | **Passives:** | {{num_passives}} / {{num_responses}} | {% if num_responses %}({{"%0.1f"|format(num_passives/num_responses*100)}}%){% endif %}

                  | **Detractors:** | {{num_detractors}} / {{num_responses}} | {% if num_responses %}({{"%0.1f"|format(num_detractors/num_responses*100)}}%){% endif %}

  workspace_widget/npsWidgetActions:
    fields:
      label: Actions
      tab_id: {{records.satisfactionTabNps.id}}
      extension_id: core.workspace.widget.form_interaction
      pos: 1
      width_units: 4
      zone: content
      params:
        interactions_kata@raw:
          interaction/createLink:
            label: Create NPS survey link
            uri: cerb:automation:cerb.satisfaction.surveys.nps.getSignedLink.interaction
            icon: check
            hidden@bool: {{not worker_is_superuser}}
        is_popup: 1
      options_kata@raw:
        hidden@bool: {{not current_worker_is_superuser}}

  workspace_widget/npsWidgetResponses:
    fields:
      label: Recent Survey Responses
      extension_id: core.workspace.widget.sheet
      tab_id: {{records.satisfactionTabNps.id}}
      pos: 2
      width_units: 4
      zone: content
      params:
        data_query@raw:
          type:worklist.records
          of:nps_survey
          expand: [customfields,]
          query:(
            limit:25
            sort:[-created]
          )
          format:dictionaries
        cache_secs:
        placeholder_simulator_kata:
        sheet_kata@raw:
          layout:
            style: table
            headings@bool: no
            paging@bool: yes
            title_column: email__context

          columns:
            card/email__context:
              label: Responder
              params:
                context_key: _context
                id_key: id
                underline@bool: no
                text_size@raw: 150%
                icon:
                  svg:
                    data_template@raw:
                      &lt;svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 100 100"&gt;
                        &lt;circle cx="50" cy="50" r="50" fill="{% if rating &gt; 8 %}#65952E{% elseif rating &gt; 5 %}#888888{% else %}#BE3B2A{% endif %}" /&gt;
                        &lt;text x="50%" y="55%" font-size="80" font-weight="bold" fill="white" text-anchor="middle" alignment-baseline="middle"&gt;{{rating}}&lt;/text&gt;
                      &lt;/svg&gt;
            text/comment:
            date/created_at:
              label: When
        toolbar_kata:

  workspace_tab/satisfactionTabCsat:
    fields:
      name: CSAT
      page_id: {{records.satisfactionPage.id}}
      extension_id: core.workspace.tab.dashboard
      pos: 2
      params:
        layout: sidebar_left
      options_kata@raw:
        hidden@bool: {{'CSAT' not in cerb_workflow_config('cerb.satisfaction.surveys','surveysEnabled')}}

  workspace_widget/widgetCsatScore:
    fields:
      label: CSAT Avg Score (90d)
      extension_id: core.workspace.widget.sheet
      tab_id: {{records.satisfactionTabCsat.id}}
      pos: 1
      width_units: 4
      zone: sidebar
      params:
        data_query@raw:
          type:worklist.subtotals
          of:csat_survey
          by.avg:rating
          query:(
            created:"-90 days to now"
          )
          format:dictionaries
        cache_secs@text:
        placeholder_simulator_kata@text:
        sheet_kata@raw:
          layout:
            style: fieldsets
            headings@bool: no
            paging@bool: no
          columns:
            text/rating:
              params:
                text_align: center
                text_size@raw: 500%
                value_template@raw: {{rating|number_format(1)}}/10
                bold@bool: yes

  workspace_widget/widgetCsatResponses:
    fields:
      label: Recent Survey Responses
      extension_id: core.workspace.widget.sheet
      tab_id: {{records.satisfactionTabCsat.id}}
      pos: 2
      width_units: 4
      zone: content
      params:
        data_query@text:
          type:worklist.records
          of:csat_survey
          expand: [customfields,]
          query:(
            limit:25
            sort:[-created]
          )
          format:dictionaries
        cache_secs@text:
        placeholder_simulator_kata@text:
        sheet_kata@raw:
          layout:
            style: table
            headings@bool: no
            paging@bool: yes
            title_column: comment

          columns:
            card/comment:
              label: Sent Message
              params:
                context_key: _context
                label_key: comment
                id_key: id
                underline@bool: no
                icon:
                  svg:
                    data_template@raw:
                      &lt;svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 100 100"&gt;
                        &lt;circle cx="50" cy="50" r="50" fill="{% if rating &gt; 7 %}#65952E{% elseif rating &gt; 5 %}#65952E{% elseif rating &gt; 3 %}#888888{% elseif rating &gt; 1 %}#BE3B2A{% else %}#BE3B2A{% endif %}" /&gt;
                        &lt;text x="50%" y="55%" font-size="80" font-weight="bold" fill="white" text-anchor="middle" alignment-baseline="middle"&gt;{{rating}}&lt;/text&gt;
                      &lt;/svg&gt;
            card/message_worker__context:
              label: Worker
              params:
                underline@bool: no
            card/message__context:
              label: Message
              params:
                underline@bool: no
                label_key: message_ticket__label
            date/created_at:
              label: When
        toolbar_kata@text:

  workspace_tab/satisfactionTabCes:
    fields:
      name: CES
      page_id: {{records.satisfactionPage.id}}
      extension_id: core.workspace.tab.dashboard
      pos: 3
      params:
        layout: sidebar_left
      options_kata@raw:
        hidden@bool: {{'CES' not in cerb_workflow_config('cerb.satisfaction.surveys','surveysEnabled')}}

  workspace_widget/widgetCesScore:
    fields:
      label: CES Avg Score (90d)
      extension_id: core.workspace.widget.sheet
      tab_id: {{records.satisfactionTabCes.id}}
      pos: 1
      width_units: 4
      zone: sidebar
      params:
        data_query@raw:
          type:worklist.subtotals
          of:ces_survey
          by.avg:rating
          query:(
            created:"-90 days to now"
          )
          format:dictionaries
        cache_secs@text:
        placeholder_simulator_kata@text:
        sheet_kata@raw:
          layout:
            style: fieldsets
            headings@bool: no
            paging@bool: no
          columns:
            text/rating:
              params:
                text_align: center
                text_size@raw: 500%
                value_template@raw: {{rating|number_format(1)}}/7
                bold@bool: yes

  workspace_widget/widgetCesResponses:
    fields:
      label: Recent Survey Responses
      extension_id: core.workspace.widget.sheet
      tab_id: {{records.satisfactionTabCes.id}}
      pos: 2
      width_units: 4
      zone: content
      params:
        data_query@text:
          type:worklist.records
          of:ces_survey
          expand: [customfields,]
          query:(
            limit:25
            sort:[-created]
          )
          format:dictionaries
        cache_secs@text:
        placeholder_simulator_kata@text:
        sheet_kata@raw:
          layout:
            style: table
            headings@bool: no
            paging@bool: yes
            title_column: comment
          columns:
            card/comment:
              label: Survey
              params:
                context_key: _context
                label_key: comment
                id_key: id
                underline@bool: no
                icon:
                  svg:
                    data_template@raw:
                      &lt;svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 100 100"&gt;
                        &lt;circle cx="50" cy="50" r="50" fill="{% if rating &gt; 7 %}#65952E{% elseif rating &gt; 5 %}#65952E{% elseif rating &gt; 3 %}#888888{% elseif rating &gt; 1 %}#BE3B2A{% else %}#BE3B2A{% endif %}" /&gt;
                        &lt;text x="50%" y="55%" font-size="80" font-weight="bold" fill="white" text-anchor="middle" alignment-baseline="middle"&gt;{{rating}}&lt;/text&gt;
                      &lt;/svg&gt;
            card/ticket__context:
              label: Ticket
              params:
                underline@bool: no
                label_key: ticket__label
            date/created_at:
              label: When
        toolbar_kata@text:

  community_portal/portalSatisfactionSurveys:
    fields:
      extension_id: cerb.website.interactions
      name: Customer Satisfaction Surveys
      uri: csat-survey
      params:
        automations_kata@raw:
          automation/nps:
            uri: cerb:automation:cerb.satisfaction.surveys.nps.interaction
            disabled@bool: {{interaction != 'nps'}}
          automation/csat:
            uri: cerb:automation:cerb.satisfaction.surveys.csat.interaction
            disabled@bool: {{interaction != 'csat'}}
        cors_origins_allowed@text:
        portal_kata@raw:
          layout:
            meta:
              title: {{cerb_workflow_config('cerb.satisfaction.surveys','portalTitle')}}
            header:
              logo:
                text: {{cerb_workflow_config('cerb.satisfaction.surveys','portalTitle')}}
              #navbar:
              #  link/website:
              #    label: Back to website
              #    href: https://cerb.ai/
              #    class: cerb-link-button

  automation/automationCsatLink:
    fields:
      name: cerb.satisfaction.surveys.csat.replyLink
      description: Generate a signed link for a CSAT survey
      extension_id: cerb.trigger.automation.function
      policy_kata@raw:
        commands:
          data.query@bool: yes
      script@raw:
        start:
          return:

  automation/automationNpsLink:
    fields:
      name: cerb.satisfaction.surveys.nps.getSignedLink
      description: Generate a signed link for an NPS survey
      extension_id: cerb.trigger.automation.function
      script@raw:
        inputs:
          text/email:
            type: email
            required@bool: yes
        start:
          set:
            params:
              email: {{inputs.email}}
              expires@date: +1 week
          return:
            signed_url: {{cerb_url('c=portal&p=csat-survey&a=nps')}}?{{params|url_encode}}&s={{params|values|join|hash_hmac(cerb_workflow_config('cerb.satisfaction.surveys','hashSecret'),"sha256")[8:24]}}

  automation/automationNpsScriptingGetLink:
    fields:
      name: cerb.satisfaction.surveys.nps.scriptingGetLink
      extension_id: cerb.trigger.scripting.function
      description: Create NPS survey links from snippets and scripting
      script@raw:
        inputs:
          text/email:
            type: email
            required@bool: yes

        start:
          function/getSignedLink:
            output: results
            uri: cerb:automation:cerb.satisfaction.surveys.nps.getSignedLink
            inputs:
              email: {{inputs.email}}
            on_success:
              return:
                signed_url: {{results.signed_url}}
      policy_kata@raw:
        commands:
          function:
            deny/uri@bool: {{uri != 'cerb:automation:cerb.satisfaction.surveys.nps.getSignedLink'}}
            allow@bool: yes

  automation/automationNpsLinkInteraction:
    fields:
      name: cerb.satisfaction.surveys.nps.getSignedLink.interaction
      extension_id: cerb.trigger.interaction.worker
      description@text:
      script@raw:
        start:
          set:
            prompt_email__context: address

          await/prompt:
            form:
              title: Generate NPS Survey Link
              elements:
                sheet/prompt_email_id:
                  label: Email address:
                  required@bool: yes
                  data:
                    automation:
                      uri: cerb:automation:cerb.data.records
                      inputs:
                        record_type: address
                        query_required: isBanned:n isDefunct:n
                  schema:
                    layout:
                      style: table
                      filtering@bool: yes
                      headings@bool: no
                      paging@bool: yes
                    columns:
                      selection/_sel:
                        params:
                          mode: single
                          value_key: id
                      card/id:
                        params:
                          bold@bool: yes
                          underline@bool: no
                      card/org_id:
                        params:
                          underline@bool: no

          function:
            output: results
            uri: cerb:automation:cerb.satisfaction.surveys.nps.getSignedLink
            inputs:
              email: {{prompt_email_address}}

          await/results:
            form:
              elements:
                say:
                  content: {{results.signed_url}}
      policy_kata@raw:
        commands:
          function:
            deny/uri@bool: {{uri != 'cerb:automation:cerb.satisfaction.surveys.nps.getSignedLink'}}
            allow@bool: yes

  automation/interactionNpsSurvey:
    fields:
      name: cerb.satisfaction.surveys.nps.interaction
      extension_id: cerb.trigger.interaction.website
      policy_kata@raw:
        commands:
          record.create:
            deny/type@bool: {{inputs.record_type is not record type ('nps_survey')}}
            allow@bool: yes
          record.search:
            deny/type@bool: {{inputs.record_type is not record type ('address')}}
            allow@bool: yes
      script@raw:
        start:
          set:
            config@json: {{cerb_workflow_config('cerb.satisfaction.surveys')|json_encode}}
          decision/validation:
            outcome/missingLink:
              if@bool: {{interaction_params.email is empty or interaction_params.expires is empty or interaction_params.s is empty}}
              then@ref: invalidLink
            outcome/badSignature:
              if@bool: {{[interaction_params.email,interaction_params.expires]|join|hash_hmac(config.hashSecret,"sha256")[8:24] != interaction_params.s}}
              then@ref: invalidLink
            outcome/expiredSig:
              if@bool: {{interaction_params.expires < 'now'|date('U')}}
              then@ref: invalidLink

          record.search:
            output: email
            inputs:
              record_type: address
              record_query: email:${lookup_email} limit:1
              record_query_params:
                lookup_email: {{interaction_params.email}}
              record_expand: _label
              validation@raw:
                {{email.id is empty ? 'Record not found.'}}
            on_error@ref: invalidLink

          await/survey:
            form:
              title: Survey
              elements:
                sheet/prompt_rating:
                  label: {{config.npsQuestion}}
                  required@bool: yes
                  data@json: {{array_fill_keys(range(0,10),[])|json_encode}}
                  validation@raw:
                    {{(prompt_rating is not numeric or prompt_rating < 0 or prompt_rating > 10) ? 'Rating must be from 0 to 10'}}
                  limit: 11
                  schema:
                    layout:
                      filtering@bool: no
                      headings@bool: no
                      paging@bool: no
                      style: scale
                      params:
                        min_label: Very unlikely
                        max_label: Very likely
                    columns:
                      selection/prompt_rating:
                        params:
                          label_key: __index
                          value_key: __index
                          mode: single
                textarea/prompt_comment:
                  label: {{config.npsCommentLabel}}

          # [TODO] Don't allow dupes from the same email within 30d
          record.create/nps:
            output: nps_survey
            inputs:
              record_type: nps_survey
              fields:
                name: {{email._label}} rated {{prompt_rating}}/10{% if prompt_comment %}: {{prompt_comment|truncate(128)}}{% endif %}
                email@int: {{email.id}}
                rating: {{prompt_rating|round}}
                cohort: {{prompt_rating > 8 ? 'Promoter' : (prompt_rating < 7 ? 'Detractor' : 'Passive')}}
                comment@key,optional: prompt_comment
                owner__context: app
                owner_id@int: 0

          await/confirm:
            form:
              elements:
                say:
                  message: Thanks for your feedback!
                submit:
                  continue@bool: no
                  reset@bool: no

        &invalidLink:
          await:
            form:
              elements:
                say:
                  message@text:
                    Sorry! This is an invalid or expired link.
                submit:
                  continue@bool: no
                  reset@bool: no
          return:

  automation/functionCsatSurveyLink:
    fields:
      name: cerb.satisfaction.surveys.csat.getSurveyLink
      extension_id: cerb.trigger.automation.function
      description@text:
      script@raw:
        inputs:
          record/message:
            record_type: message
            required@bool: yes
        start:
          set:
            config@json: {{cerb_workflow_config('cerb.satisfaction.surveys')|json_encode}}
            expires_in@date: 7 days
            draft_token: {{inputs.message.token}}
            hash: {{[draft_token,expires_in]|join|hash_hmac(config.hashSecret)[26:18]}}
          return:
            survey_link@text:
              {{cerb_url('c=portal&p=csat-survey&a=csat')}}?m={{draft_token}}&s={{hash}}&expires={{expires_in}}
      policy_kata@raw:
        commands:

  automation/interactionCsatSurvey:
    fields:
      name: cerb.satisfaction.surveys.csat.interaction
      extension_id: cerb.trigger.interaction.website
      description@text:
      script@raw:
        start:
          set:
            config@json: {{cerb_workflow_config('cerb.satisfaction.surveys')|json_encode}}
            valid_s: {{[interaction_params.m,interaction_params.expires]|join|hash_hmac(config.hashSecret)[26:18]}}

          decision/validation:
            outcome/missingLink:
              if@bool: {{interaction_params.m is empty or interaction_params.expires is empty or interaction_params.s is empty}}
              then@ref: invalidLink
            outcome/badSignature:
              if@bool: {{valid_s != interaction_params.s}}
              then@ref: invalidLink
            outcome/expiredSig:
              if@bool: {{interaction_params.expires < 'now'|date('U')}}
              then@ref: invalidLink

          # Find the message by token
          record.search/message:
            output: message
            inputs:
              record_type: message
              record_query: token:${lookup_token} limit:1
              record_query_params:
                lookup_token: {{interaction_params.m}}
              record_expand: _label
              validation@raw:
                {{message.id is empty ? 'Record not found.'}}
            on_error@ref: invalidLink

          # Does this survey already exist?
          record.search/survey:
            output: lookup_survey
            inputs:
              record_type: csat_survey
              record_query: message:(id:${message_id})
              record_query_params:
                message_id@int: {{message.id}}
            on_success:
              outcome/dupe:
                if@bool: {{lookup_survey|length}}
                then@ref: alreadyExists

          # Prompt for the survey response
          await/survey:
            form:
              title: Survey
              elements:
                sheet/prompt_rating:
                  label: {{config.csatQuestion}}
                  required@bool: yes
                  data:
                    1:
                      label: very dissatisfied
                      rating: 1
                    3:
                      label: dissatisfied
                      rating: 3
                    5:
                      label: neutral
                      rating: 5
                    7:
                      label: satisfied
                      rating: 7
                    10:
                      label: very satisfied
                      rating: 10
                  validation@raw:
                    {{(prompt_rating is not numeric or prompt_rating < 0 or prompt_rating > 10) ? 'Rating must be from 0 to 10'}}
                  limit: 5
                  schema:
                    layout:
                      filtering@bool: no
                      headings@bool: no
                      paging@bool: no
                      style: scale
                    columns:
                      selection/rating:
                        params:
                          mode: single
                      # [TODO] SVG icon
                      text/label:
                textarea/prompt_comment:
                  label: {{config.npsCommentLabel}}

          record.create/csat:
            output: csat_survey
            inputs:
              record_type: csat_survey
              fields:
                name: Rated {{message.worker__label}} as {{prompt_rating}}/10{% if prompt_comment %}: {{prompt_comment|truncate(128)}}{% endif %}
                message@int: {{message.id}}
                worker@int: {{message.worker_id}}
                rating: {{prompt_rating|round}}
                comment@key,optional: prompt_comment
                ip: {{client_ip}}
                owner__context: app
                owner_id@int: 0

          await/confirm:
            form:
              elements:
                say:
                  message: Thanks for your feedback!
                submit:
                  continue@bool: no
                  reset@bool: no

        &invalidLink:
          await:
            form:
              elements:
                say:
                  message@text:
                    Sorry! This is an invalid or expired link.
                submit:
                  continue@bool: no
                  reset@bool: no
          return:
        &alreadyExists:
          await:
            form:
              elements:
                say:
                  message@text:
                    We already have a response for this survey link.
                submit:
                  continue@bool: no
                  reset@bool: no
          return:
      policy_kata@raw:
        commands:
          record.create:
            deny/type@bool: {{inputs.record_type is not record type ('csat_survey')}}
            allow@bool: yes
          record.search:
            deny/type@bool: {{inputs.record_type is not record type ('csat_survey','message')}}
            allow@bool: yes

  automation/dataQueryNpsScore:
    fields:
      name: cerb.satisfaction.surveys.nps.dataQuery.score
      extension_id: cerb.trigger.data.query
      description@text:
      script@raw:
        inputs:
          text/date_range:
            required@bool: yes

        start:
          data.query/nps_surveys:
            inputs:
              query@text:
                type:worklist.subtotals
                of:nps_survey
                by.count:[cohort]
                query:(created:${date_range})
                format:dictionaries
              query_params:
                date_range@key: inputs:date_range
            output: results

          set:
            num_responses@int: {{array_sum(results.data|column('count'))}}
            num_promoters@int: {{array_sum(results.data|filter((v) => v.cohort=='Promoter')|column('count'))}}
            num_passives@int: {{array_sum(results.data|filter((v) => v.cohort=='Passive')|column('count'))}}
            num_detractors@int: {{array_sum(results.data|filter((v) => v.cohort=='Detractor')|column('count'))}}
            score@int: {{100*((num_promoters/num_responses) - (num_detractors/num_responses))}}

          return:
            data:
              nps:
                num_responses@key: num_responses
                num_promoters@key: num_promoters
                num_passives@key: num_passives
                num_detractors@key: num_detractors
                score@key: score
      policy_kata@raw:
        commands:
          data.query:
            deny/type@bool: {{query.type != 'worklist.subtotals'}}
            allow@bool: yes

  automation/csatReplyIncludeCsatLink:
    fields:
      name: cerb.satisfaction.surveys.csat.replyAppendCsatLink
      extension_id: cerb.trigger.mail.draft
      description: Include the #survey-csat link on outgoing messages
      script@raw:
        start:
          outcome/notNewReply:
            if@bool:
              {{
                is_resumed
                or draft_type != 'ticket.reply'
                or '#survey-csat' in draft_params.content
              }}
            then:
              return:

          return:
            draft:
              params:
                content: {{draft_params.content|replace({"#signature\n":"#signature\n#survey-csat\n"})}}
      policy_kata@raw:
        commands:

  automation/csatGenerateSentCsatLink:
    fields:
      name: cerb.satisfaction.surveys.csat.generateSentCsatLink
      extension_id: cerb.trigger.mail.send
      description: Replace the #survey-csat token with a link on the sent message
      script@raw:
        start:
          set:
            config@json: {{cerb_workflow_config('cerb.satisfaction.surveys')|json_encode}}
            expires_in@date: 7 days
            survey_link@text:
              {% set hash = [draft_token,expires_in]|join|hash_hmac(config.hashSecret)[26:18] %}
              {{cerb_url('c=portal&p=csat-survey&a=csat')}}?m={{draft_token}}&s={{hash}}&expires={{expires_in}}
          return:
            content:
              # Remove from the saved copy
              replace/saved:
                on:
                  html@bool: yes
                  text@bool: yes
                  sent@bool: no
                  saved@bool: yes
                text: #survey-csat
                with@text:

              # Replace on the sent HTML copy
              replace/sentHtml:
                on:
                  html@bool: yes
                  sent@bool: yes
                  text@bool: no
                  saved@bool: no
                text: #survey-csat
                with@text:
                  ~~~~~~~~~~~~~~~~~~~~~~~~~
                  [How did I do?]({{survey_link}})

              # Replace on the sent plaintext copy
              replace/sentText:
                on:
                  text@bool: yes
                  sent@bool: yes
                  html@bool: no
                  saved@bool: no
                text: #survey-csat
                with@text:
                  ~~~~~~~~~~~~~~~~~~~~~~~~~
                  How did I do? {{survey_link}}
      policy_kata@raw:
        commands:

  automation/cesSendClosedTicketSurvey:
    fields:
      name: cerb.satisfaction.surveys.ces.sendClosedTicketSurvey
      extension_id: cerb.trigger.record.changed
      description: Send a CES survey on closed tickets
      script@raw:
        start:
          outcome/notClosed:
            if@bool:
              {{
                is_new
                or record_status == was_record_status
                or record_status != 'closed'
                or was_record_elapsed_resolution_first
              }}
            then:
              return:

          set:
            config@json: {{cerb_workflow_config('cerb.satisfaction.surveys')|json_encode}}
            survey_link@trim:
              {% set hash = [record_mask]|join|hash_hmac(config.hashSecret)[26:18] %}
              {{cerb_url('c=portal&p=csat-survey&a=ces')}}?m={{record_mask}}&s={{hash}}

          record.create:
            output: new_draft
            inputs:
              record_type: draft
              fields:
                type: mail.transactional
                is_queued: 1
                queue_delivery_date@date: now
                name: CES survey for {{record_initial_message_sender_address}} on {{record__label}}
                params:
                  to: {{record_initial_message_sender_address}}
                  subject: How did we do?
                  format: parsedown
                  content@text:
                    You recently contacted us.

                    Reference: #{{record_mask}}
                    Subject: {{record_subject}}

                    [How did we do?]({{survey_link}})

                    --
                    Support
      policy_kata@raw:
        commands:
          record.create:
            deny/type@bool: {{inputs.record_type is not record type ('draft')}}
            allow@bool: yes

  automation_event_listener/listener_ces_record_changes:
    fields:
      name: CES Surveys
      event_name: record.changed
      priority@int: 50
      is_disabled: {{'CES' not in cerb_workflow_config('cerb.satisfaction.surveys','surveysEnabled')}}
      event_kata@raw:
        automation/cesClosedSurvey:
          uri: cerb:automation:cerb.satisfaction.surveys.ces.sendClosedTicketSurvey
          disabled@bool:
            {{
              is_new
              or record_status == was_record_status
              or record_status != 'closed'
              or was_record_elapsed_resolution_first
            }}

  automation_event_listener/listener_csat_mail_draft:
    fields:
      name: CSAT Surveys
      event_name: mail.draft
      priority@int: 50
      is_disabled: {{'CSAT' not in cerb_workflow_config('cerb.satisfaction.surveys','surveysEnabled')}}
      event_kata@raw:
        automation/csatLink:
          uri: cerb:automation:cerb.satisfaction.surveys.csat.replyAppendCsatLink
          disabled@bool:
            {{
              is_resumed
              or draft_type != 'ticket.reply'
              or '#survey-csat' in draft_params.content
            }}

  automation_event_listener/listener_csat_mail_send:
    fields:
      name: CSAT Surveys
      event_name: mail.send
      priority@int: 50
      is_disabled: {{'CSAT' not in cerb_workflow_config('cerb.satisfaction.surveys','surveysEnabled')}}
      event_kata@raw:
        automation/csatLink:
          uri: cerb:automation:cerb.satisfaction.surveys.csat.generateSentCsatLink
          disabled@bool:
            {{
              draft_type != 'ticket.reply'
              or draft_worker_id is empty
              or '#survey-csat' not in draft_params.content
            }}

  metric/metric_nps:
    fields:
      name: cerb.satisfaction.surveys.nps.score
      type: gauge
      description: Net Promoter Score (NPS) over time

  automation_timer/timer_nps:
    fields:
      name: Sample NPS score to metric
      is_recurring: 1
      recurring_patterns@raw:
        # Every hour
        0 * * * *
{% endraw %}
</code>
</pre>