Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED48955AB43
	for <lists+linux-fbdev@lfdr.de>; Sat, 25 Jun 2022 17:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbiFYPUA (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 25 Jun 2022 11:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbiFYPT7 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 25 Jun 2022 11:19:59 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE2112D1A
        for <linux-fbdev@vger.kernel.org>; Sat, 25 Jun 2022 08:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1656170393;
        bh=cakOIyvQnB2MPEAIJq10i21+66FfjwtA9Uuq6ogAgDQ=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=BYn1EwTU0Ijdlv8B5fo9rA0svSwQsaAyZ1q6wWmdYqSO4BvaD7tEXgJhcR1V4Pf98
         YGcdVS3URBdj6Oxom1tWdk8Rp1YzykS63UpGVL9/h6rqBDJk695ibtz7GE9LA3Bdnk
         gUGtpCFB4pIWrB/KbbIPf2pcxNDIdnulzW45dBAs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.162.44]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6sn7-1namv80lLj-018MtW; Sat, 25
 Jun 2022 17:19:53 +0200
Message-ID: <676b746e-3421-aab3-5f3f-34170dd04d81@gmx.de>
Date:   Sat, 25 Jun 2022 17:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 3/4] fbmem: Fix input parameter checks for
 user-provided screen resolution changes
Content-Language: en-US
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-fbdev@vger.kernel.org, daniel.vetter@ffwll.ch,
        dri-devel@lists.freedesktop.org
References: <20220625122502.68095-1-deller@gmx.de>
 <20220625122502.68095-4-deller@gmx.de> <YrcGCkHuWHv3I6Fx@phenom.ffwll.local>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <YrcGCkHuWHv3I6Fx@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rpaHWlmM8QuqvMqENYNodcp4ofXTMZXLi+RbtmMg1CDedGtI/Jo
 gyX4FKUwcx3MaEishgzdD74N7WRS5SCgKQteVmHJlxV1YglhdlYyCATZdcAp1wALl48D8DU
 c/97J3MqJB7uYO8sKN9gNjQ+yILBQFxWyElGnfwWlqm4nVtCiqWzfrNdvOTJFi0RJUsnoMq
 fe+0GDdzUU+3zW6bMtscQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tJBuKu1xkWM=:s59ITzhweDaYVHALqBTWOZ
 iiKgRBFF0AkiJ2NnwICfIPGAo45yblCt3VSWCCzDfUyrIcJSUob6kDdxcAZjXgW6nUWelS9GP
 R4hEeUetpp5SOqtgld9g2S+YB/rU4e/OIBX7CD283QCvA6HnZkqRnkFrDtxrnnBdMJKO1gKCJ
 Q00iZPPzHMLJhWd3IyLwWgjUIzRy0x/ZZWPwYm0NmjpAp51eLR68J0BRffAJX401Z3HIZ+IKj
 TKMgX6N3dWhi1j57kwt0DMCL1R6glXPZCH2dW58LJSKntXGK7ELhn7RqS8ox+Ho0pDJvUSVpV
 si5PbSdhOz9yztPtl9EIpFfYON08jz6yY6Pi2C3sSMCyWP1mtYRZxNQ8SvmLN1adnl296O6ea
 QTLhkCSWmwc+JvJPiY+w7NRAS4inw7LA3QKMD2ojjIrLMTaEO9N5QZ5UD4Ad/EKkQU95cCJGA
 yCmkwN9ZFWsxct8kVZA8Tz0LyXIwpmwWh+ksZCc+6+N5fHLvolSdIBUEXuifw4U4Rfw52dORK
 Q77zkP/qYgKVgIcqkRezr+ChWiwYUkSluTqGEwPRvlDnFMtwAshyZiFwH8t/I9cnA9k3e3h2D
 yY89SHusX0P8G4PEQyTIlpRwol+baS+N6upEFH9pkRIsOARvps0/XWegoYvmVGzzlTh6jJWlY
 SEU1ajjErsdSju8kMoDl0rYYs95jKGDdwj+lJEGGvtvuAcAwd84S6IsFGIWXjN7PA+2YKfSay
 x6maHrxf7AFqgjCjbDKc9qHtyPH3zhRPvsYZ/oy26KthXk2vf29DS+gg7DKEiic4gVSZ8YrmE
 wsTZ3M6AZJoDoi2fco8sHmgw+nxRbMWhPcOz9nxLpq+BYVv/Lf30KzX6t+rttFP8WTku1vjua
 MfG8PAJounyWyfGGuOJdFR+HGI8lqmdsdmVa93Q/IcjA8wPiJs3oYeOomfmUDTGCQFNNwKWm6
 aaP7SYYbx2saB64qTm6hOuJ1+G6tTYZiX91NACtzixsuqyD7n+1Fej/+I6XEs9rjt1cOvhZNU
 0J2LqayeDR5bL6fhPyJckLXpBhY7Rnfnum54Ip7rgzn21yopAMpxVjpZHVXQdx0Gnl18D+JzA
 RwFTVS2OJVUpaXuEm6mKGUP29efUt6sgm364RnSjweh0z1w8pAkxAW4Og==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 6/25/22 14:56, Daniel Vetter wrote:
> On Sat, Jun 25, 2022 at 02:25:01PM +0200, Helge Deller wrote:
>> Enhance the checks in the FBIOPUT_VSCREENINFO ioctl handler to verify
>> the user-provided new screen size for:
>>
>> a) virtual screen size >=3D physical screen size, and
>>
>> b) new screen size is bigger than currently configured console font siz=
e.
>>
>> Return -EINVAL on invalid input.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Cc: stable@vger.kernel.org # v5.4+
>
> Imo squash this into the previous one please. Doesn't make sense to spli=
t
> the patch which adds a function from it's callsite.

I do disagree on this.
In my experience it's often much easier for backporting to have a patch wh=
ich
provides a new generic function and the patches with the callers of it in =
seperate patches.

I'm not religious about this opinion here, so if you REALLY want it, I'll =
change
it. But personally I think this isn't a good idea and would prefer to leav=
e it in seperate patches.

Helge


> -Daniel
>
>> ---
>>  drivers/video/fbdev/core/fbmem.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/cor=
e/fbmem.c
>> index afa2863670f3..50fb66b954d6 100644
>> --- a/drivers/video/fbdev/core/fbmem.c
>> +++ b/drivers/video/fbdev/core/fbmem.c
>> @@ -1106,7 +1106,13 @@ static long do_fb_ioctl(struct fb_info *info, un=
signed int cmd,
>>  			return -EFAULT;
>>  		console_lock();
>>  		lock_fb_info(info);
>> -		ret =3D fb_set_var(info, &var);
>> +		if (var.xres_virtual < var.xres ||
>> +		    var.yres_virtual < var.yres)
>> +			ret =3D -EINVAL;
>> +		if (!ret)
>> +			ret =3D fbcon_modechange_possible(info, &var);
>> +		if (!ret)
>> +			ret =3D fb_set_var(info, &var);
>>  		if (!ret)
>>  			fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
>>  		unlock_fb_info(info);
>> --
>> 2.35.3
>>
>

