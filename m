Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47613D3628
	for <lists+linux-fbdev@lfdr.de>; Fri, 11 Oct 2019 02:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbfJKAhY (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 10 Oct 2019 20:37:24 -0400
Received: from mx6.ucr.edu ([138.23.62.71]:65178 "EHLO mx6.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727699AbfJKAhY (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 10 Oct 2019 20:37:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1570754242; x=1602290242;
  h=mime-version:references:in-reply-to:from:date:message-id:
   subject:to:cc;
  bh=uXv2UQ3LODrzT9UfKJz+VhFwzGfiQWvz0Klpty0YInQ=;
  b=m8x+hKa4K0wS9q71aRam5CJu8pE7no+UxIhC7lu20IS7gFISlD9gmAmy
   XQeots17UT9hyO61SAP+nGWqy/TUSHldNgcEtMY5rmkeIrd/Efq+r9Vus
   ybjArvOxtmLf01PRVHx222/5sqDHPic6XHOCKUAe/Kv99ycp75uHVLH3H
   lz/Fm3/HN+pRozgdo9aiLifA10dgfuPHt/Oo6PmmXDuscYz+isLrjPkxx
   4hXzgbsvYKWBZCtjmlzhCMqXLUJJ7K06RMoevjFDFq36km6tIruoQdW8p
   rPPe8D5ijgjsYlUtunMYIWVd8KLBhW1tHclFe9gcajZPXM1mYGEHN/0wG
   Q==;
IronPort-SDR: XZKp7e5vlB015EXJUHGG3pTn3inJYNZZmGsuYqE57RoL2x0dHmH+UZXSiwT74qkfhJqN8a0nfp
 KTzmnBMXZG4RhzZiNfb3Kcec2xL8Ie1SsA6CTWbTkueVvaujBe7l3HE8HieDbhyYcgupchecMC
 xpJ4j4zp2pOeK+737NgG7vzv3PIM5u+vCDX5g1zy4rifUp6OL/fLqoYE1fQ76nQeyGS1Pz+FIX
 5waAdNaZUw8O8TVuJPeeolITC6R8MAZnEsV7iMpmttU8S/RUQ/9DvkjG7wEsxcJscmCQOnJd04
 Tg4=
IronPort-PHdr: =?us-ascii?q?9a23=3Ae2mB3RSuTfZ3dWnnAEWdtSt/E9psv+yvbD5Q0Y?=
 =?us-ascii?q?Iujvd0So/mwa69bBeN2/xhgRfzUJnB7Loc0qyK6vumBzBLusvJmUtBWaQEbw?=
 =?us-ascii?q?UCh8QSkl5oK+++Imq/EsTXaTcnFt9JTl5v8iLzG0FUHMHjew+a+SXqvnYdFR?=
 =?us-ascii?q?rlKAV6OPn+FJLMgMSrzeCy/IDYbxlViDanbr5+MRu7oR/Qu8QZjodvJKY8wQ?=
 =?us-ascii?q?bVr3VVfOhb2XlmLk+JkRbm4cew8p9j8yBOtP8k6sVNT6b0cbkmQLJBFDgpPH?=
 =?us-ascii?q?w768PttRnYUAuA/WAcXXkMkhpJGAfK8hf3VYrsvyTgt+p93C6aPdDqTb0xRD?=
 =?us-ascii?q?+v4btnRAPuhSwaLDMy7n3ZhdJsg6JauBKhpgJww4jIYIGOKfFyerrRcc4GSW?=
 =?us-ascii?q?ZdW8pcUTFKDIGhYIsVF+cOMuhYoIv9qVUArhWwGBeiC//0xz9UmnP7x7E23/?=
 =?us-ascii?q?g9HQzE2gErAtIAsG7TrNXwLKodU+G1zajIzTXeaPNdxDTy6IjSfRAgvPqBWr?=
 =?us-ascii?q?JxcMvRyUY1FgPJkkmcpIL+MjOIyusNqXKX4PR9WuKykmMqrRx6rDu3xso0lI?=
 =?us-ascii?q?XFmoYYxkrH+Ch52oo5O8G0RU1hbdK5FJZdsyeXPJZsTMw4WWFnoiM6x6UDuZ?=
 =?us-ascii?q?68YScF1owqxwXaa/yba4iI5Q/jVPqJLTd4mn1lfLW/ig638Ue6y+38UtC40F?=
 =?us-ascii?q?JIriZYi9XMuG0B2hjX58SdRft9+UCh2TmL1w/N8O1LPUc0la/DJ54gxL4/iI?=
 =?us-ascii?q?YTvFzdEiPqnEj6lqybe0U+9uS29+jqYa/qqoKYOoJwkg3+N74hms27AeQ2KA?=
 =?us-ascii?q?gOWG2b9Py81bzi/U32WrRKguEqnqTXq53aONgUprSjDwBLz4kj9g6zDy2639?=
 =?us-ascii?q?QAgXkHMFVFdQqDj4joPVHOPf/5Ae6xg1u3jThk2e7GM6b/ApXCMHfDiq3tfb?=
 =?us-ascii?q?Vj5E5Gzgo809Rf64hTCrEbL/KgEnP24fDRCFcSOhaszuD7Bc81go8XXySEC7?=
 =?us-ascii?q?WBPaXOvEWg4fgmKO2BIoQSvWCuBeIi4qvfjG05hFhVT6mg3NNDeWK4F/U+ex?=
 =?us-ascii?q?6xfHH2xNoNDDFZ7UIFUOX2hQjaAnZobHGoUvd5v2ljBQ=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2F7AAAwzp9dh8fQVdFmHAEBAQEBBwE?=
 =?us-ascii?q?BEQEEBAEBgWoEAQELAYQQKoQjjl2CD5slAQgBAQEOLwEBhEACgl0jNwYOAgM?=
 =?us-ascii?q?JAQEFAQEBAQEFBAEBAhABAQEIDQkIKYVAgjopAYM9AQEBAxIRVhALCw0CAiY?=
 =?us-ascii?q?CAiISAQUBHAYTIoMAgngFpUaBAzyLJoEyiGIBCQ2BSBJ6KAGMDYIXhCM+h1K?=
 =?us-ascii?q?CXgSBOQEBAZUvllcBBgKCEBSMVIhFG5lAp3wPI4FFgXwzGiV/BmeBTlAQFIF?=
 =?us-ascii?q?pjkwkMJB2AQE?=
X-IPAS-Result: =?us-ascii?q?A2F7AAAwzp9dh8fQVdFmHAEBAQEBBwEBEQEEBAEBgWoEA?=
 =?us-ascii?q?QELAYQQKoQjjl2CD5slAQgBAQEOLwEBhEACgl0jNwYOAgMJAQEFAQEBAQEFB?=
 =?us-ascii?q?AEBAhABAQEIDQkIKYVAgjopAYM9AQEBAxIRVhALCw0CAiYCAiISAQUBHAYTI?=
 =?us-ascii?q?oMAgngFpUaBAzyLJoEyiGIBCQ2BSBJ6KAGMDYIXhCM+h1KCXgSBOQEBAZUvl?=
 =?us-ascii?q?lcBBgKCEBSMVIhFG5lAp3wPI4FFgXwzGiV/BmeBTlAQFIFpjkwkMJB2AQE?=
X-IronPort-AV: E=Sophos;i="5.67,282,1566889200"; 
   d="scan'208";a="81589197"
Received: from mail-lj1-f199.google.com ([209.85.208.199])
  by smtpmx6.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Oct 2019 17:37:15 -0700
Received: by mail-lj1-f199.google.com with SMTP id y28so1385843ljn.2
        for <linux-fbdev@vger.kernel.org>; Thu, 10 Oct 2019 17:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZcWxfPlnGPAO2yo7t6F26rix4NWYfye93UCn2ZNXKJ8=;
        b=p9UlalBiwBxf4apxhcqUNc7U+6iSyMmKkfxGcuKiD9dR6W6WBAc79S/Qytww1TP7gU
         r6tMmyHhRc5H9Rehl1Cw3EELB3hb+3gk9iaWkGIwmigagxojHSSgGhMtCc+DsvMdXTw4
         GcXS+Z/y4/0SmulUo43pfubMpcFIjqLoyeF4kYI248f6pgk06QPxwgOGKybax02hPGFe
         L4KC4ZvLqJQfpSvq9jgPkzLth+jDsfpSR9hjdDHGDLrIlnJv/D0m0Brh0woAFA3ns+xP
         VQHuOMru1VYXMbx+gma+7VWvr+N303U/pXh0Cl/OTci0LicEufqIAub5Z4/L17IBS9XV
         Ysvw==
X-Gm-Message-State: APjAAAXExJl8aLqfRWL9mcT35pIycmhY/mx2xImVOkmaXh3NAnhUzuFa
        cWt0PO0XKJAXACerORYAcTnBMvUWfDwfyh+1Gp27M0DM4Ltk7xapBqkjNBjhTpRFxv54xgqIGky
        R9hm8bq79v/axjHzf/DCPvQZEHipsPPYD/OoXGvn/
X-Received: by 2002:a19:ee08:: with SMTP id g8mr2680861lfb.117.1570754235351;
        Thu, 10 Oct 2019 17:37:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwbqzp9i04wuktQmil7d0bMJlOGaeRnmQG5uBtRDRKLB00XbM3BrsBPCdcJjoQsH+RggVfxOXKBguWYLkvp+gg=
X-Received: by 2002:a19:ee08:: with SMTP id g8mr2680852lfb.117.1570754235067;
 Thu, 10 Oct 2019 17:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191010043809.27594-1-yzhai003@ucr.edu> <20191010091834.GG20470@kadam>
In-Reply-To: <20191010091834.GG20470@kadam>
From:   Yizhuo Zhai <yzhai003@ucr.edu>
Date:   Thu, 10 Oct 2019 17:37:56 -0700
Message-ID: <CABvMjLQ+_rRJT_yeKE9AKJaxhSU5LbcZdenbOr8CdPoD+4Oprw@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: Potential uninitialized field in "pll"
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
        Teddy Wang <teddy.wang@siliconmotion.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Sorry about that, let me resend it .

On Thu, Oct 10, 2019 at 2:53 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Wed, Oct 09, 2019 at 09:38:08PM -0700, Yizhuo wrote:
> > Inside function set_chip_clock(), struct pll is supposed to be
> > initialized in sm750_calc_pll_value(), if condition
> > "diff < mini_diff" in sm750_calc_pll_value() cannot be fulfilled,
> > then some field of pll will not be initialized but used in
> > function sm750_format_pll_reg(), which is potentially unsafe.
> >
> > Signed-off-by: Yizhuo <yzhai003@ucr.edu>
>
> The patch is correct, but it doesn't apply to linux-next any more.  Can
> you re-write it on top of the most recent staging-next and resend?
>
> regards,
> dan carpenter
>


-- 
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
