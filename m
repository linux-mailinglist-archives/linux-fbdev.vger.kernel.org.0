Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C97F563598E
	for <lists+linux-fbdev@lfdr.de>; Wed, 23 Nov 2022 11:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237125AbiKWKUE (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 23 Nov 2022 05:20:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237184AbiKWKTc (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 23 Nov 2022 05:19:32 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DE6131836
        for <linux-fbdev@vger.kernel.org>; Wed, 23 Nov 2022 02:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1669198021; bh=RQUWH3/o4ZJE/OJ46mSyCApDpmQr7lBE/a/H1SZbnew=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=Pu4lABZwwz2ik/eGw/9bmmWGEH7jGw//8Ix8PlILCzkskvy9J4UNBRdqH1yD50j6R
         8/ZGlAJZYAYyuF9Xt0kW3TagIdxMSbFiosAUlwYHX3/nFxnyZ6FqbVre/Pvzy4U7T0
         8EZEMfAmgt/7DyiKA474XCUT15A9fo0Q8mdGwo84ERirSzhg4ny/2QffGHiMvn852n
         Ff5BJteVgCqhGutrrA1XwYzqNEDYNIc0n3O+dWq4OuRa0pHp3sO6g8wnrITybm5KKV
         91X3BMJqCYD6FleN8CyhvDB+7siSDOlE3IGYluZkxCTcvcem3JMaQLac6Q5W3Bz6Nu
         ni/zqbhRCn5ug==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.168.154]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wGi-1ouUrx1ysG-003Li8; Wed, 23
 Nov 2022 11:07:01 +0100
Message-ID: <6119bc50-7661-b406-9f95-165916844de1@gmx.de>
Date:   Wed, 23 Nov 2022 11:07:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] video: ep93xx: Add missing clk_disable_unprepare in
 ep93xxfb_probe()
Content-Language: en-US
To:     Gaosheng Cui <cuigaosheng1@huawei.com>,
        alexander.sverdlin@gmail.com, sam@ravnborg.org,
        nikita.shubin@maquefel.me
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20221123092943.2259585-1-cuigaosheng1@huawei.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20221123092943.2259585-1-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lLo46CYdS21UM4IEjAz71cBuMqulit9UlxcZdD/aBIjTLfKXc8/
 itZcQQcu7BkJkJXUOpm/zbkHTIdNJAO1HdPbFy1Ib9JxkHRm9o5rz0GI4e4sJwZa7wdC1hn
 jACP2uRYz8bAAPtuyLtJrFMHrGP5YAYqhOkALtG2NCr0qBbcUrS/HqDBTeu6z8X0/j5Mayz
 q7el1NcI3naWLZh07UVwQ==
UI-OutboundReport: notjunk:1;M01:P0:jzM50VaM84s=;pR29CAUemAfG6SZv9M32qamlWc3
 4MomzUFi98pALteAG4uOLuYLrDV6GIG2/pnKhVbACyn9g7CfKwPvGIy4+S2OmaU3s6EaqN7hZ
 gZb6F2epOqGtO1HnXnwhUCvOBJcsTxEOq7YYSCfl+QcVZpAvSJZ+vhXuM0eg5/BKaumuRyTGt
 of0tkai7/bBHrk2bccDWoJ5ksf928ImTXqDlCFK7wHWNZD5PpjOvmZt9dB3OHKbWjxK6Vzt37
 Skzf95ve/8QTrxpq7sfz5lldNIgnwQjafjgyiu5vIzNIhdHjuzmpH/j6lHKOk8DB2wy1FBXki
 I9goJEDOrrqesd86QSn4pFyLJVZ0jYgaPdL/V697ra/EMEFnE3b6yH3tpVi+xSB1bRYVbxTEc
 dvVxAXhY9HyRdohjPnerFOGDsGpX4mzyW5MEOCanuQxrRH0wkh61sOmPmX4wx06pg0IiJTDac
 pzZqyCEDQt5R+Guajc8PT5pULEZo+5EiHDdTQBCvWn/6ewuEpLXixxhpzUut98hPjXsP4EF+s
 c9hkqA+MOyffTrD8Qo9v0JtoAoL41F6Eo763eWfPopJAw/dNCY/wvru4IJO7/Q7D4R0v/lBaK
 bnUy/4syLKgROp/pzixzSrgmJgJO12to5zY9XpgxntxHKcwR0CcmBmDSg9kOI1VC4VBtcJKZs
 LXkz19wW+srCVONF/gyhuTxtjRbWJjSTlSkyGE88A8hTVa0oeQLgm/Rr8jJMwqM9PU3gJZ0LZ
 /yIeqm0hPrLeM8XfjT8iY9GpBsH+aENs4uPIhcRocKWzt72Ief2ELE7xTL/h6ELAvew07u+3d
 r3z4/BZOrYtHObjaiO7MYl/rWSmRMyrgpaJaxRz3i7k8h7yp8ycV926l/bn49mth+jMTnBx54
 cQX4ahkDeqo7XAfFfCH1ZHBMKv7AAKpSh55UD1718Kcqtg4AnscUeOYzJz5bB4rMikSMc2KNg
 w5uuxB36jev8yQZKjImSTNLcFdM=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 11/23/22 10:29, Gaosheng Cui wrote:
> The clk_disable_unprepare() should be called in the error handling
> of register_framebuffer(), fix it.
>
> Fixes: 0937a7b3625d ("video: ep93xx: Prepare clock before using it")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

applied.

Thanks!
Helge

> ---
>   drivers/video/fbdev/ep93xx-fb.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/ep93xx-fb.c b/drivers/video/fbdev/ep93x=
x-fb.c
> index 2398b3d48fed..305f1587bd89 100644
> --- a/drivers/video/fbdev/ep93xx-fb.c
> +++ b/drivers/video/fbdev/ep93xx-fb.c
> @@ -552,12 +552,14 @@ static int ep93xxfb_probe(struct platform_device *=
pdev)
>
>   	err =3D register_framebuffer(info);
>   	if (err)
> -		goto failed_check;
> +		goto failed_framebuffer;
>
>   	dev_info(info->dev, "registered. Mode =3D %dx%d-%d\n",
>   		 info->var.xres, info->var.yres, info->var.bits_per_pixel);
>   	return 0;
>
> +failed_framebuffer:
> +	clk_disable_unprepare(fbi->clk);
>   failed_check:
>   	if (fbi->mach_info->teardown)
>   		fbi->mach_info->teardown(pdev);

