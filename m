Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18E1676968E
	for <lists+linux-fbdev@lfdr.de>; Mon, 31 Jul 2023 14:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231492AbjGaMnJ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 31 Jul 2023 08:43:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbjGaMmz (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 31 Jul 2023 08:42:55 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7761110FF
        for <linux-fbdev@vger.kernel.org>; Mon, 31 Jul 2023 05:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1690807350; x=1691412150; i=deller@gmx.de;
 bh=yRxXX913CYWRa8tXbgcXgYUKEdWaC4JfHSNxWU/JTYE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=cQ49Dwl7x+piXC5cIDBYFGRNv21vhfHk6GTS7+hW6o5bfI4XaWFCKGCQw+7EZ9d07igAZyz
 Uzj2M594Cs0f3U3sLFTlJd6ouClC42gSUtqFIoN8jWMQQLNhPs/TTju7Y09hdGlspRynKbGWy
 zMPEYcX/ihUc9nRR9RZ4squGGw0WSTtWLBxeeKKyk6mjaQevBpS/ZM0VkGTpcJKOv4cEtVBrr
 MW4LJJes8naZNbT16t94fyyoCpOeSMWjl9czPsVb/mEI934H52EnfrclmkHbbVwo8uPS9S1NU
 dCgbZtD82zkVknYhGemrq+FcANrmNpB0HUAmnc+YRypy7Hc9Xjpw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.159.238]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mwwdl-1pfNNt1BRj-00ySdU; Mon, 31
 Jul 2023 14:42:30 +0200
Message-ID: <3d06d451-613b-e872-89f9-c1ffffde2b47@gmx.de>
Date:   Mon, 31 Jul 2023 14:42:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] video: fbdev: ssd1307fb: Print the PWM's label
 instead of its number
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jilin Yuan <yuanjilin@cdjrlc.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@pengutronix.de
References: <20230728145824.616687-1-u.kleine-koenig@pengutronix.de>
 <20230728145824.616687-3-u.kleine-koenig@pengutronix.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20230728145824.616687-3-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gF7wtH6jUDnhg8wkOkHbkB8mw82DUCkxkVn0UcreVLVQ3f0DA94
 tOxpZJ1Rlb9jtgxEcOb8c/S8zLXYh4+Ncn4qHnA79NVpwoJPKkoXAEpk0TOOJjwybJvFjz3
 0/heuC2QK5Mcj7QZX7EXiuwDe2tpfGIr3tNk6vA+YVlCggywqScxx5Xid5qAwVt7visGN+J
 8BFTsGvkY/etd1PY5SJ3A==
UI-OutboundReport: notjunk:1;M01:P0:PNQsvJEvGHA=;cQhF9baDSZH13ugyF2rJO0B3hX6
 ImRJpSQ5/NvkU96MqFeeFkkH3mnyWsEm+9bGvuTYtxWXjfZd7YKwPu1p0v/B/JJaZAU01Kjtb
 EoYPqaLGDWVukTLHSs3ZW1IMj2DCI5SUb9fRaMf1Wlk9j5r+gXq1Z8/uRbMgdzdX4CnqSppDQ
 NVIWaWHVY/cxxIokKGCEfYfiAp4kb+x9QVcsqGNqEELWWNoYkaDBt+GqGO7Ib7ZwVd44vHnyB
 lleWah/UoD18fsMvZTr4KQZc6mfH22N1+fZTYGCLWzsq7ND+KAXAAz1b9Mje0qF3TRuil55Jy
 3RlGpxVAWZXnGgBK3rqSGEbG7uPhJtCMm0JdVS2MV7wvbYY4jiEs/6I6bFn/8o1g0O1in4fN9
 r+1tOB0l+GZ+QQ3aS9gk+MvJ4o/EaDL0sNBarHtcVOolNBMWYMyj2+ymMi4ReEp9EDYVSqdHI
 tfSK5brpW3niF/TCmAAdO/iK4n6iN0pcxB7UrEpNwl0rWV3XxSF+I6C/xktfzdS6fRcNTYbcn
 1xr85/mIcwVf8IY7oxnavoK3X5iubdmuTK31v5UX7cRHXvuv/41gcaTl2KXDIwSjQIkbOx7VK
 B5X4v6Yus2M35YH1FmLRPNoSazg9r/D4GeXTN7RD7nT23IbORLq6eafq1YWO1jZM9IhkR8QAy
 psFgf5NtuOgSnFV8YUX4KElmM1CL96YYqpCt4WmSZDKCuWvL4atz8dFEcE3F9v3XGSRmsYisp
 8uZLS8xjEgnGzNo3HmJ9GSCGxiXOTFP3rQF3Ra/1sPfbIa1LZVx+5RMGFKvcuZNOertJGgGcA
 EKyDvlmlNVIe3rFTRoH8+xX2BJR9PlcNlmPafiLXBfH4DDvUoZWPZdPQHjFWmkLCR9xeHDNnm
 2846HHajm0PrYfQr71txdJHbgALpISG+kMLxBDSJRrFF2+wKL95WsAw8S5qenFWORPWZSZpGw
 dGtHS8CfHaPtHgdKsZr2uvMBTbI=
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 7/28/23 16:58, Uwe Kleine-K=C3=B6nig wrote:
> struct pwm_device::pwm is a write-only variable in the pwm core and used
> nowhere apart from this and another dev_dbg. So it isn't useful to
> identify the used PWM. Emit the PWM's label instead in the debug
> message.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

applied.

Thanks!
Helge

> ---
>   drivers/video/fbdev/ssd1307fb.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd13=
07fb.c
> index 11c373798279..46881a691549 100644
> --- a/drivers/video/fbdev/ssd1307fb.c
> +++ b/drivers/video/fbdev/ssd1307fb.c
> @@ -399,8 +399,8 @@ static int ssd1307fb_init(struct ssd1307fb_par *par)
>   		/* Enable the PWM */
>   		pwm_enable(par->pwm);
>
> -		dev_dbg(&par->client->dev, "Using PWM%d with a %lluns period.\n",
> -			par->pwm->pwm, pwm_get_period(par->pwm));
> +		dev_dbg(&par->client->dev, "Using PWM %s with a %lluns period.\n",
> +			par->pwm->label, pwm_get_period(par->pwm));
>   	}
>
>   	/* Set initial contrast */

