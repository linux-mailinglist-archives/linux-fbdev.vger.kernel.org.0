Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8624AF3E1
	for <lists+linux-fbdev@lfdr.de>; Wed,  9 Feb 2022 15:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234699AbiBIORK (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 9 Feb 2022 09:17:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234498AbiBIORJ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 9 Feb 2022 09:17:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5E45EC06157B
        for <linux-fbdev@vger.kernel.org>; Wed,  9 Feb 2022 06:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644416230;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KRUhAeA84UjsLS4HbxlBt5EQCd/sdN8Mn9sTcjqUddo=;
        b=ebvB37XEVDGNG1FebJq3zHD7HgMjQmwBonivNYdUNNK8ACLoS/jw++nxdP2W0WeZw3JPof
        hnkwCqRQe17s7icRJkDo/hlRT+i9SarminlNHc+herT8qlmzDZrOwK0SNR5dIiBcym8AXD
        DiDDpNUnaAydAMRrgkYDUdRHdlXY6MY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-6iLShMibNZKAKHDO2okzUA-1; Wed, 09 Feb 2022 09:17:09 -0500
X-MC-Unique: 6iLShMibNZKAKHDO2okzUA-1
Received: by mail-wm1-f70.google.com with SMTP id l4-20020a05600c4f0400b0037bb2ce79d8so2706660wmq.9
        for <linux-fbdev@vger.kernel.org>; Wed, 09 Feb 2022 06:17:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KRUhAeA84UjsLS4HbxlBt5EQCd/sdN8Mn9sTcjqUddo=;
        b=jvUMytkyP/AUF89Z7lo9nI+ltIO18dMMicXPaJMBiTBud0D022lqteIBx6mj5t55Ga
         LEpf5TKj/D9iih+QsP0e9SPtRU+PHOeza6qD3AFYZVxRfGrKVANkIlagSj49q2jBPdrd
         wLoSHirVql+AH5j8VbFwvoSWP+qRZh6koMcZV1z/wRxN9RS3yZQI5DVF4OWYXV4HasHw
         FqHH+4l842kLqfBZUcqEMBXIKQH+mjrp5loP5wbgiQNwb1rYnLhfLQUoGCY/+ZHagyVp
         RbeEhMNnB+nmkKR5VntLM/vjfwMrTFgvtGH2XdIrVriYwuLNq3xznzpI2tbKm2ymeYLr
         v6Kw==
X-Gm-Message-State: AOAM532Oo3NjcxMCU+XgB42+3G6pKNgjW/Z2prEzGsY9bMpNvdxhyV16
        08dPz7P7Rn6Mk6vGk+0RLYZPWZhL8434c4+9TPRaZLGkry/I5UXqqPpiLNc9iRN0WUjepntTp8W
        VWwOG40DkzaQsAv8TZhJQ5Ck=
X-Received: by 2002:a05:600c:4e16:: with SMTP id b22mr2290153wmq.8.1644416228503;
        Wed, 09 Feb 2022 06:17:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwIzQ5Y+IJIHsSpt0Pgn2iyoVM/suryQvdT8KlECfzPpYA1vTVAA9aQ4WkCb9TTM9E2pUG9Q==
X-Received: by 2002:a05:600c:4e16:: with SMTP id b22mr2290117wmq.8.1644416228230;
        Wed, 09 Feb 2022 06:17:08 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f13sm5562779wmq.29.2022.02.09.06.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 06:17:07 -0800 (PST)
Message-ID: <d1025530-90e1-fbc5-c06b-f62ed83f2f19@redhat.com>
Date:   Wed, 9 Feb 2022 15:17:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/7] drm: Add driver for Solomon SSD130X OLED displays
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-fbdev@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-pwm@vger.kernel.org
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-4-javierm@redhat.com>
 <YgPE8Z7HxU2wv7J/@sirena.org.uk>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YgPE8Z7HxU2wv7J/@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello Mark,

Thanks for your feedback.

On 2/9/22 14:43, Mark Brown wrote:
> On Wed, Feb 09, 2022 at 10:03:10AM +0100, Javier Martinez Canillas wrote:
> 
>> +	if (ssd130x->vbat_reg) {
>> +		ret = regulator_enable(ssd130x->vbat_reg);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to enable VBAT: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
> 
> Unless the device supports power being physically omitted regulator
> usage should not be optional, it's just more code and a recipie for poor
> error handling.

The device has a VCC pin but in most cases this is just connected to a
power provided by the board in its pinout header. For example, I've it
connected to a rpi4 3.3v pin.

I guess in that case what we should do then is to just have a regulator
fixed as the vbat-supply in the Device Tree, that's regulator-always-on.

The old ssd1307fb fbdev driver also had this as optional and I wanted to
keep the new driver as backward compatible. But I understand now that is
not describing the hardware properly by making this regulator optional.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

