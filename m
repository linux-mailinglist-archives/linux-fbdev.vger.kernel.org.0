Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34FCB769677
	for <lists+linux-fbdev@lfdr.de>; Mon, 31 Jul 2023 14:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231785AbjGaMhu (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 31 Jul 2023 08:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230411AbjGaMht (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 31 Jul 2023 08:37:49 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB17BE;
        Mon, 31 Jul 2023 05:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1690807063; x=1691411863; i=deller@gmx.de;
 bh=Ms/avEkI75OIEgYMCo/ytKRctnQrgMl6JO+Gl0Gsf3w=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=RebDnHcgL27HOM7ubal87JY21pjQAIdbgHQII3yFaR5CGhUtnu+USUcXNQGKl44Jm3YzXW6
 MvuHC+Qa8QdqdwmOasFYXs9uNTLT0SF2BdetuFEKBVFpxcTCLzyS0TufboynGOKp6T1s48WLb
 w58lW1DBGCQKk4KC5Qz9yhUCkvdOUDVV7cxzb1ErBKKn/rGMNvBWAyhbYvzDZJQ3dJn656bVE
 q6znwxxttioVC5UHbT6RECAyk/rPsjgj25NaamF69w/9CUU+Z1b4DUSnU5m9YPam5t8yrpqXr
 9nRohZDNxbB0RwNjiKS80hl4SWcRchatB954G7lxqrcaL1t1h0VQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.159.238]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVeMA-1qGaod0KTE-00Rbnx; Mon, 31
 Jul 2023 14:37:43 +0200
Message-ID: <76b3c602-ab9d-7368-2c83-f5a8f4f0f330@gmx.de>
Date:   Mon, 31 Jul 2023 14:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] fbdev/amifb: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Content-Language: en-US
To:     Atul Raut <rauji.raut@gmail.com>
Cc:     linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20230731021808.24997-1-rauji.raut@gmail.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20230731021808.24997-1-rauji.raut@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:f/tCxU4mR2FSkwyxg/Pz1S54l9RKyiB9xbF6exUuGYhXcj3zYKL
 rUUcpgrq4tx8L+3f+/jpbi8QYi1L7ah575zv5Dw2aomoFeVmZmPoZmqJ0XlPb2GOBd5yEkn
 t+avf4l8Exyi+PZIQko4SQXR3gwj7AU4ssMhbyzSFK8aILd1e+wxGhvVsFReettVkPwT1n5
 MkuFm60XSmKCbmHefRwmg==
UI-OutboundReport: notjunk:1;M01:P0:7h3/yL6t/qk=;+J46rFQhxCOAdSskQUGZ+gnmBGC
 dVBvHoqWyyTn0IjIia/X5UrDziZjViqhLXA4ZJbaNdral0IGCd+HcuKsPq1XjRC66wKjbsaFq
 vLCCZwzJzPYV8FWVzkzjop8YGbWZyZCYqha599kevSG0g9xX30OTyK0TrrVXkqmPSSuflkcLl
 uBVSBDr+B4i8VIsUbptEITjyFoj0oPhe9Jq3NEA0Upj/tI4CvE0FU6xBBEae7dp2fQZHi+PS3
 /G/bgTMYAp8CpxVzogZG27o0ETM/doRFn8/FhCUjRovSQpXqoSeXUZ4VuVzFoO8QWUCo+sQVM
 e1GudTgpHngilR5ayD6hKEZMnuGfWLMjqwsD3QrW5Jg/kAOnlr7E38k4OJhD++iJXpc2Hc+2W
 EnxvLp0riV+2uPxd5SOR1L2dXo0mA6E7MMUPTGGfHJAWPABHgKUqExzGv3YGeN9yN2iMyW2Wq
 qG/HZ9R44CEdMG1DkdiM8B0fTI7k+OPukX8hxfCFEya8Pl6d3WUKOWvfpPmfgwcssQhqrqs2b
 aUzS5GI0hutNwiBXf/Gs2jyCYhvGo+LXtO+dVglnpHEwgcluA2xuVC4LG6tqbF0GEgoaQgryZ
 Qufb79yjzLR+6SDp3uHLtQZxv4xknJVmI97eR6tvOugRadzcDOClulFaXPsALJxML2+3MF1YB
 iPLJbtU0C83K9A+9EGp+VgC1tKSAuR0mo/+Xpq4ZPq4V8bKdYrKDs2eGjzIxQw2RUPwbNqkkI
 TBqv7sXGuoNQv3JDHYYt+jEpOax0cUkSkho9KsgG2vWo9qkzAr72aMmosLSSBzGpbSUZZy+pH
 5I/lAO6cL1c1koENnUoqfELQi8PxZF5v3rcAsfpspeP1/uL/6EzDZ2w+ouQxQ/wHrh2BTSvdI
 wlcfRWOHj87hQedfAEeXnp3M9e+fWLXiwJiiMpX/3deBv4cTfJaa10+twJoIganjCj7gTRL2F
 UuSifw==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 7/31/23 04:18, Atul Raut wrote:
> Replacing zero-length arrays with C99 flexible-array members
> because they are deprecated. Use the new DECLARE_FLEX_ARRAY()
> auxiliary macro instead of defining a zero-length array.
>
> This fixes warnings such as:
> ./drivers/video/fbdev/amifb.c:690:6-10: WARNING use flexible-array membe=
r instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#=
zero-length-and-one-element-arrays)
>
> Signed-off-by: Atul Raut <rauji.raut@gmail.com>

applied.
Thanks!
Helge

> ---
>   drivers/video/fbdev/amifb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/amifb.c b/drivers/video/fbdev/amifb.c
> index d88265dbebf4..f216b2c702a1 100644
> --- a/drivers/video/fbdev/amifb.c
> +++ b/drivers/video/fbdev/amifb.c
> @@ -687,7 +687,7 @@ struct fb_var_cursorinfo {
>   	__u16 height;
>   	__u16 xspot;
>   	__u16 yspot;
> -	__u8 data[1];			/* field with [height][width]        */
> +	DECLARE_FLEX_ARRAY(__u8, data);	/* field with [height][width]        *=
/
>   };
>
>   struct fb_cursorstate {

