Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80777261199
	for <lists+linux-fbdev@lfdr.de>; Tue,  8 Sep 2020 14:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730188AbgIHMrT (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 8 Sep 2020 08:47:19 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45570 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730086AbgIHLjH (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 8 Sep 2020 07:39:07 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200908113703euoutp01afed14ec5ef42b00034be3ea91c49f58~yy_nqaC_q0570405704euoutp01c
        for <linux-fbdev@vger.kernel.org>; Tue,  8 Sep 2020 11:37:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200908113703euoutp01afed14ec5ef42b00034be3ea91c49f58~yy_nqaC_q0570405704euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1599565023;
        bh=SPHqHJ2dbxrJnDJeFzqnDBnwxgoXZzlXQRb9kXnJBa8=;
        h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
        b=O3jj8gi/AO0E1B52SNjw5FN7MdGcw7UGSmhmNqsbyjBW2wRdStKiOjhA7FGnmQUiI
         HpF2t+YY1W7gYT2QpEbyvYZYhVPkJi8euOhfQfeOpXtHW9GgFvju4W+QQUb2jYgp/d
         LraEQuAFfyV1rjHvgyHFOVGWzMkRzYnu/8u0vg0M=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200908113702eucas1p1f007d60b8cfda0d86caed3f07dfa439c~yy_ncn2pU0115401154eucas1p1O;
        Tue,  8 Sep 2020 11:37:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 10.A5.06318.EDC675F5; Tue,  8
        Sep 2020 12:37:02 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200908113702eucas1p2856ca25619baab242eb6ad71dbcedea8~yy_nES1Yn2030620306eucas1p28;
        Tue,  8 Sep 2020 11:37:02 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200908113702eusmtrp1910d455ddaa3238b7aa9509289874b75~yy_nDj7lP2002320023eusmtrp1K;
        Tue,  8 Sep 2020 11:37:02 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-3a-5f576cdebe39
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 06.A4.06017.EDC675F5; Tue,  8
        Sep 2020 12:37:02 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200908113702eusmtip2105dcc4b97067a1556ced319d65629b5~yy_mxOdWG1663016630eusmtip2I;
        Tue,  8 Sep 2020 11:37:02 +0000 (GMT)
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: fbdev: sis: fix null ptr dereference
To:     trix@redhat.com
Cc:     thomas@winischhofer.net, akpm@osdl.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-ID: <2b8139d8-12c9-3685-9160-fc92ae08aac0@samsung.com>
Date:   Tue, 8 Sep 2020 13:37:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200805145208.17727-1-trix@redhat.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsWy7djP87r3csLjDS6/MLfYuaKH3eLK1/ds
        Fif6PrBaXN41h81i9crH7BbXvpxmcWDzuN99nMnj2vmvjB7v911l8/i8Sc5jwYz/LAGsUVw2
        Kak5mWWpRfp2CVwZf658ZivoE6i4tvgjawPjNJ4uRk4OCQETiVOXFrJ0MXJxCAmsYJRYeP8s
        I0hCSOALo8SxqSEQic+MEsdXdjJ3MXKAdfSczYOIL2eUmHBwDiuE85ZR4teEw6wg3WwCVhIT
        21eBTRIWcJDY0b+PDcQWERCW+PP5LxNIA7NAB6PExubf7CAJXgE7idV7voE1swioSEzatpsF
        xBYViJD49ABiKK+AoMTJmU/A4pwCphLbvtxjBrGZBcQlbj2ZzwRhy0tsfzuHGWSBhMAqdoln
        j36xQTzqIjG54S4ThC0s8er4FnYIW0bi9OQeFoiGdYwSfzteQHVvZ5RYPvkfVLe1xJ1zIJM4
        gFZoSqzfpQ8RdpSYs3MKCyRc+CRuvBWEOIIP6IHp0ODilehoE4KoVpPYsGwDG8zarp0rmScw
        Ks1C8tosJO/MQvLOLIS9CxhZVjGKp5YW56anFhvnpZbrFSfmFpfmpesl5+duYgSmntP/jn/d
        wbjvT9IhRgEORiUeXg/fsHgh1sSy4srcQ4wSHMxKIrxOZ0/HCfGmJFZWpRblxxeV5qQWH2KU
        5mBREuc1XvQyVkggPbEkNTs1tSC1CCbLxMEp1cBoX/l9oVHq3kcSz1ydLdev9G2t2Jq5tv+i
        7e7t8bMedmY/4L4svc9+rZJJq+r9NxM5Li0pi8j6OuHy0j7BORadbGe2s3yavX9zs2C2iW/H
        Sr3yX78SM36rndWvFQ7x0H9gWGzvfuzJlvZG0xU1JqcWelyz7WHgvbHkbNXWBVw5xfbTHb76
        sZgosRRnJBpqMRcVJwIASmRhZzkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsVy+t/xe7r3csLjDaZ3K1jsXNHDbnHl63s2
        ixN9H1gtLu+aw2axeuVjdotrX06zOLB53O8+zuRx7fxXRo/3+66yeXzeJOexYMZ/lgDWKD2b
        ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MP1c+sxX0
        CVRcW/yRtYFxGk8XIweHhICJRM/ZvC5GLg4hgaWMEs+PH2KCiMtIHF9f1sXICWQKS/y51sUG
        UfOaUWL542fMIAk2ASuJie2rGEFsYQEHiR39+9hAbBGQhs9/mUAamAU6GCXa5y9ihugGcg72
        bQDr4BWwk1i95xsriM0ioCIxadtuFhBbVCBC4vCOWVA1ghInZz4Bi3MKmEps+3IPbDOzgLrE
        n3mXoGxxiVtP5jNB2PIS29/OYZ7AKDQLSfssJC2zkLTMQtKygJFlFaNIamlxbnpusZFecWJu
        cWleul5yfu4mRmCsbTv2c8sOxq53wYcYBTgYlXh4P3iFxQuxJpYVV+YeYpTgYFYS4XU6ezpO
        iDclsbIqtSg/vqg0J7X4EKMp0HMTmaVEk/OBaSCvJN7Q1NDcwtLQ3Njc2MxCSZy3Q+BgjJBA
        emJJanZqakFqEUwfEwenVAPjpcw6u5tr/mzdsjFt/+0tSZtUpmdxagV05L+PNHXQvKn0+V+o
        m+8ik5sNK6w23ngUwGjiUJRn2Lo4btHJE4fy04pvZzL/eb1b7cYL3+ufHVUmW8Y2+losWt/k
        ZvZk01Xu9GMHslL4kw8sONrK8a5JOZV9m+PyO7e25xkYTQg8Mr1WYLmo0MxaJZbijERDLeai
        4kQAOcTOCcsCAAA=
X-CMS-MailID: 20200908113702eucas1p2856ca25619baab242eb6ad71dbcedea8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200805145226eucas1p1e0e6d9fa3c05f7e247365f0db17cbe38
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200805145226eucas1p1e0e6d9fa3c05f7e247365f0db17cbe38
References: <CGME20200805145226eucas1p1e0e6d9fa3c05f7e247365f0db17cbe38@eucas1p1.samsung.com>
        <20200805145208.17727-1-trix@redhat.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


On 8/5/20 4:52 PM, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this representative error
> 
> init.c:2501:18: warning: Array access (from variable 'queuedata') results
>   in a null pointer dereference
>       templ |= ((queuedata[i] & 0xc0) << 3);
> 
> This is the problem block of code
> 
>    if(ModeNo > 0x13) {
>       ...
>       if(SiS_Pr->ChipType == SIS_730) {
> 	 queuedata = &FQBQData730[0];
>       } else {
> 	 queuedata = &FQBQData[0];
>       }
>    } else {
> 
>    }
> 
> queuedata is not set in the else block
> 
> Reviewing the old code, the arrays FQBQData730 and FQBQData were
> used directly.
> 
> So hoist the setting of queuedata out of the if-else block.
> 
> Fixes: 544393fe584d ("[PATCH] sisfb update")
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied to drm-misc-next tree, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/sis/init.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/video/fbdev/sis/init.c b/drivers/video/fbdev/sis/init.c
> index dfe3eb769638..fde27feae5d0 100644
> --- a/drivers/video/fbdev/sis/init.c
> +++ b/drivers/video/fbdev/sis/init.c
> @@ -2428,6 +2428,11 @@ SiS_SetCRT1FIFO_630(struct SiS_Private *SiS_Pr, unsigned short ModeNo,
>  
>     i = 0;
>  
> +	if (SiS_Pr->ChipType == SIS_730)
> +		queuedata = &FQBQData730[0];
> +	else
> +		queuedata = &FQBQData[0];
> +
>     if(ModeNo > 0x13) {
>  
>        /* Get VCLK  */
> @@ -2445,12 +2450,6 @@ SiS_SetCRT1FIFO_630(struct SiS_Private *SiS_Pr, unsigned short ModeNo,
>        /* Get half colordepth */
>        colorth = colortharray[(SiS_Pr->SiS_ModeType - ModeEGA)];
>  
> -      if(SiS_Pr->ChipType == SIS_730) {
> -	 queuedata = &FQBQData730[0];
> -      } else {
> -	 queuedata = &FQBQData[0];
> -      }
> -
>        do {
>  	 templ = SiS_CalcDelay2(SiS_Pr, queuedata[i]) * VCLK * colorth;
>  
> 
