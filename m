Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8F0469A721
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Feb 2023 09:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjBQIin (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 17 Feb 2023 03:38:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjBQIil (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 17 Feb 2023 03:38:41 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8266512869
        for <linux-fbdev@vger.kernel.org>; Fri, 17 Feb 2023 00:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676623071;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MSzy/8JN5jaVlg7s7Ev+cHsdti/OpYprCjQK25MrEM0=;
        b=CNgZmlkaWlaYgy2ejei3/tmvRtdQy6MM1s4riwHq5JOwIiAOYcMNzl+FOCXEY/uRASZB8D
        OHgbDlARMUhTUEm/g64XGE5QPCsoGn4gqlu75VyJHvcJ/P+3OYfEF63XfUyBzhlYrlJS3E
        cGSkuEhTYIygsl9ZEVkQJ0DeQpsVnKc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655--6YJQP80ME2DfPQ_OYsSUw-1; Fri, 17 Feb 2023 03:37:49 -0500
X-MC-Unique: -6YJQP80ME2DfPQ_OYsSUw-1
Received: by mail-wm1-f72.google.com with SMTP id k2-20020a05600c1c8200b003dd41ad974bso306610wms.3
        for <linux-fbdev@vger.kernel.org>; Fri, 17 Feb 2023 00:37:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSzy/8JN5jaVlg7s7Ev+cHsdti/OpYprCjQK25MrEM0=;
        b=5OC3WRH0+DylsczJ+6TW6Vo1sNKZWgn4gmQS6HKUynI8gyP7YA6NR1geEBRa/+64yV
         MYM+UgywDxhNv7R5gik9/5D/J8NqphGaplXZowfAd+PRtUpLbWk+aeerJxfPLIeYuh/6
         31Ip4+xa1fCC0iKAmNO+e/eIjFUor+CdEU4vX5rC12NBZaBd99GebG8xMZyzLswa2Kod
         PF7QrsqF+ljrFH7ZCWIyotltlKy6L4JhuKFjd3YGyJjyb4aydEeAwMv6RGUEew8N6wJ+
         WIlUDZqo2rqLeMPjcIpajDwbkewJo6FSWxMwxo5B0SZ/9e+SYTfgW8S1KPRKImv+oFWZ
         TTjw==
X-Gm-Message-State: AO0yUKUrw0G0po0DOHdLZFAEkdTpeT/TA+v/tsAN7QuV46SU7anU06pQ
        VyomABEvmbGsIt/7thr5qvA3JupMTswNIEQ/hdCT7y+w6JimdB9yxGDYCoBfjW/mwg9ufxXgG1q
        XMf4RjGSNyl9X5gpbMmH0UiY=
X-Received: by 2002:a05:600c:16c7:b0:3e2:1e01:803a with SMTP id l7-20020a05600c16c700b003e21e01803amr1933588wmn.9.1676623068629;
        Fri, 17 Feb 2023 00:37:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8mFyGd004x7JjuNSnWDCqg+N00uieOFI0jxDxZPqHUm7LxzesmJkc9kYDEF+RIXwKqhhHhUQ==
X-Received: by 2002:a05:600c:16c7:b0:3e2:1e01:803a with SMTP id l7-20020a05600c16c700b003e21e01803amr1933569wmn.9.1676623068346;
        Fri, 17 Feb 2023 00:37:48 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id x9-20020a05600c21c900b003e11ad0750csm4292183wmj.47.2023.02.17.00.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 00:37:47 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@gmail.com, deller@gmx.de,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        geoff@infradead.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/11] fbdev: Transfer video= option strings to caller;
 clarify ownership
In-Reply-To: <20230209135509.7786-3-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-3-tzimmermann@suse.de>
Date:   Fri, 17 Feb 2023 09:37:46 +0100
Message-ID: <87a61cy9et.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> In fb_get_options(), always duplicate the returned option string and
> transfer ownership of the memory to the function's caller.
>
> Until now, only the global option string got duplicated and transferred
> to the caller; the per-driver options were owned by fb_get_options().
> In the end, it was impossible for the function's caller to detect if
> it had to release the string's memory buffer. Hence, all calling drivers
> leak the memory buffer. The leaks have existed ever since, but drivers
> only call fb_get_option() once as part of module initialization. So the
> amount of leaked memory is not significant.
>
> Fix the semantics of fb_get_option() by unconditionally transferring
> ownership of the memory buffer to the caller. Later patches can resolve
> the memory leaks in the fbdev drivers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> +	if (option) {
> +		if (options)
> +			*option = kstrdup(options, GFP_KERNEL);
> +		else
> +			*option = NULL;
> +	}
>

I know the old code wasn't checking if kstrdup() succeeded, but you should
do it here and let the caller know. And same if (!options). So I guess the
following check can be added (to be consistent with the rest of the code):

	if (!*option)
		retval = 1;

>  	return retval;
>  }
> -- 
> 2.39.1

Best regards,
Javier

