Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 133A35523D2
	for <lists+linux-fbdev@lfdr.de>; Mon, 20 Jun 2022 20:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241509AbiFTSZm (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 20 Jun 2022 14:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238810AbiFTSZm (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 20 Jun 2022 14:25:42 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBDEC1D309;
        Mon, 20 Jun 2022 11:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1655749531;
        bh=g1DrBhSApPqCrOkx7rqvIZlJ4nA4K9qZgEmyWNfkG1g=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=LPWXOKns/sUNNC5ie4zr1SOVSbuwDE5MHA4y1LWq1ClUNfjzu/jkVDj9J5g7QtgyT
         plHhrs50yQa2W43qxlv4/9yPAUMT10DMrVLNNeU61hBajUYj1uwaxvF2himdCquBWs
         RVHFc7GHX9CUBTII1SabztPKQ38kCeGgMxQUSbmo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.174.149]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRCK6-1oHi6o3aiq-00N6Bo; Mon, 20
 Jun 2022 20:25:30 +0200
Message-ID: <f7e75426-035b-bf0a-b565-bc816b4eeb23@gmx.de>
Date:   Mon, 20 Jun 2022 20:25:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] fbdev: simplefb: Check before clk_put() not needed
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>, Yihao Han <hanyihao@vivo.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20220602094219.13024-1-hanyihao@vivo.com>
 <84aa3225-d514-4c08-f6d3-ed8f0423e513@redhat.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <84aa3225-d514-4c08-f6d3-ed8f0423e513@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:F7AmgmvffE840tXWVRq7mb8PATQeMnhx+HwH9ip+oSIRJIYMOEI
 Mc4HXrcX+QKZJ7V/nkhoiI/Dxz+zY6IAx3ijx43pkPQZKPCJSwQyek/li3OkJffXzUQHSMx
 u0kbgcV9SZbD9lvK/ukwKjRRCbZqtDwbv8uEGtIL+xk3wGPn9+4fFavnmtGUl9XIh5yDwDU
 TuLtJe+WcWTqk+tXZqJ5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TzJKf2LyMVk=:n70VceyDlP3L499n504Lja
 DRe5F+1r2lDAW5JEM99pCAWctF0QSTjJzHeJXUXT/CvIxu37uD7Oejws3klX1K+kTSPuQoxiI
 60nkDosVueRU7HvGfEYvsT0wipD0Buxk0ofEyln3T3K78eGcWPjnY7AeuBRnE05wOqn7k84Zz
 nfbQ0AOvWzLOhI+0zdLX65WqwHaWUBhacEmzdXRcCxOJ7vnL/+Pw/8Jo3XplFfxbkT5snqXXz
 KsURX4dxbVI9+963ErTxz0vIZpmBeCaU8pxtiaq7F557gehOhK0AcwQvyRdGwEMDH0MpI9azG
 9KM9+PHnZdx3Dhd4Ws5vKulMBGyJ4Eg0XUm5WgsLPpAeuTt+fByF0dJZn+mXbYwSEfSPRVuIN
 61bcoe0rcUQcDpUdC2ofeitx8Qeq4H/A+Q1IP4449RjGXNHU1H+B50eG4g2jFGrvfOE2/uMOU
 rDJ8Yt3C0CK2i8ChYJudqcps+ga3TGcwW813dJ6BDYmBnQdDLB6zEGElMH/IJPe5GOWhInuum
 s05E4wHRt4l2Ks+oTwY+Gr6mFqtotn4U2KWaAc9R3KXUTr55hTTgqrGCOfZ2B/yWLg1T0C5fb
 Y5Yniuq4q7XyA83z4jQ9/ptVKSr2G3djKbkQyTliFy+lJOlJF/zi3UeYkCFiBWLNMuIRZmHg5
 oFdWFc4fcVi7WUeGTMe7/7kcyujwndi9OXJvc42OlURg/VvBCWDm0Hv/ZauD/ZDterl/rv7ej
 ljZjA79OLXikhmzpYGTryj1q88l95FZYmo7cvL9OJHpSfO0ySP/iMrfDpb1rpBCLMIA/FQhLd
 0J0fqmk9NlpAyQaUYcJhzAxkaMViYwK+fhD2Bq6LL28IiRTm64z+5hQ3xa2uMuX7G7mRWqXPf
 mKUqgDNmaXtyT45cVHPKJSwRoJ9V8x8LMqKAYLqH958sUVtWpoJwJmU70+k/qBQrDJhQ0YgBt
 h5smT0eRUPvK+VUglNgsQ2/dQkSQQ17BeMHKU21vKmI+NGoYTrZX79eLPngkn+mvveI5CrVfM
 AxRZmRCVVCma1oY9+dMQe9oivXEOfxWatKZ9WPW2+248RgWiyckDyp1BfEy+xiXo4FRdTdH79
 t1aJnD3B5PrXkP+rz0eSt1cJgFk2fXrKCS57FwWN5OCL1SY3ED9l2UvoA==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 6/2/22 12:50, Hans de Goede wrote:
> Hi,
>
> On 6/2/22 11:42, Yihao Han wrote:
>> clk_put() already checks the clk ptr using !clk and IS_ERR()
>> so there is no need to check it again before calling it.
>>
>> Signed-off-by: Yihao Han <hanyihao@vivo.com>
>> ---
>>  drivers/video/fbdev/simplefb.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simpl=
efb.c
>> index 2c198561c338..f96ce8801be4 100644
>> --- a/drivers/video/fbdev/simplefb.c
>> +++ b/drivers/video/fbdev/simplefb.c
>> @@ -237,8 +237,7 @@ static int simplefb_clocks_get(struct simplefb_par =
*par,
>>  		if (IS_ERR(clock)) {
>>  			if (PTR_ERR(clock) =3D=3D -EPROBE_DEFER) {
>>  				while (--i >=3D 0) {
>> -					if (par->clks[i])
>> -						clk_put(par->clks[i]);
>> +					clk_put(par->clks[i]);
>>  				}
>>  				kfree(par->clks);
>>  				return -EPROBE_DEFER;
>
> Thanks, patch looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

applied to fbdev tree.

Thanks!
Helge
