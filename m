Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76C80574718
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 Jul 2022 10:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236397AbiGNIhP (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 14 Jul 2022 04:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236864AbiGNIhC (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 14 Jul 2022 04:37:02 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B23F3ED4D
        for <linux-fbdev@vger.kernel.org>; Thu, 14 Jul 2022 01:37:01 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id v16so1531920wrd.13
        for <linux-fbdev@vger.kernel.org>; Thu, 14 Jul 2022 01:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=H3bGT1ZyGPu3PRQJlJHyQI9TvTjBPuNSyHjFOzNfiP0=;
        b=XrPG1uZaQRn1UCA0WJJ2pmJQ1csZW3HabgB7E+QXuACfRhko5FjAocWwoGAFMQM+4K
         maoBv4gTZQXqu9EJzYUg27HWYGn7H4ps8X1YfFKAamIhhLSUESO1F6QG9mJgGHe0KMpr
         yS6EmWRT7znGhWAi5CHDysnG1OxosqIxRYFf098GB0Xs4T6zMcBwQ+Ijt6ciUPeVVUwm
         NwEO+Wz1v4Oa+mBtHNRupxuLErGpDho6oqFPRIm2MU+57eHEreDtv9TWX6BBq17KbV3w
         UCTpqQeOnk576xhvUmMdcgTy5b4PgstjqS11/4Py/0diTc9tD3MngzVuJ3uMtq9Qr/CL
         qkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=H3bGT1ZyGPu3PRQJlJHyQI9TvTjBPuNSyHjFOzNfiP0=;
        b=u7aJeBMfN1xvZTvkYsBBC7QuxOL8awd3pxKnPVqFTNa1VWWnDxD+q4PJa5UnrwsfLl
         sYq47ZYkuKdGcrKnPCCFVmEOo+TCbnbWIskT0Bh2rbaQgri6XaOP9k9NCTiV8bpsEl9V
         YPD+YeGKOPsPDEsX9rvyJPdoCiY54MnbFF3gYK223pO/gVAuDz91zB8+KLwUj1XbvagL
         GQ7oowolF7vjKBfNQN+plW9K5MmE8LHho9aEyCxa3jzo53JX1vSNHcfRzT7rb2AwbzN6
         aPAy4UBh0t6E7yN1SfNTORfLw/DnzXqbhnC7u+tzUFNqYK4gmh7+iHuA0r6CwVGITFf9
         2KTw==
X-Gm-Message-State: AJIora9vWSOjIr1XxJLhw8WzQbB6yhAs49lU78VV87FQw9l4OywLO7bC
        NeiOI0toyzfs/UB9ofVqKQ9jlnt9g6xyrnSFIh9/5MLRI3+owQ==
X-Google-Smtp-Source: AGRyM1u3j4Kh8ROf600mZ9n+2mzPHZx1NFVtrSntlSiwIK2NP6HVto6IIpM3hlWxyt39lgmrdSwWdCXGiGrSzCPb6JE=
X-Received: by 2002:a05:6512:3d27:b0:489:e623:f244 with SMTP id
 d39-20020a0565123d2700b00489e623f244mr4930609lfv.236.1657787809582; Thu, 14
 Jul 2022 01:36:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9041:0:0:0:0:0 with HTTP; Thu, 14 Jul 2022 01:36:48
 -0700 (PDT)
Reply-To: abdwabbomaddahm@gmail.com
From:   Abdwabbo Maddah <abdwabbomaddah746@gmail.com>
Date:   Thu, 14 Jul 2022 09:36:48 +0100
Message-ID: <CAFC-3ifKFkAVLmD=8z4VAKFLX0pV+_h5OJ=Ks62m+0uk+DimKQ@mail.gmail.com>
Subject: Get back to me... URGENT
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:42c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4708]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [abdwabbomaddah746[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [abdwabbomaddah746[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

-- 
Dear,
I had sent you a mail but i don't think you received it that's why am
writing you again.It is important you get back to me as soon as you
can.
Abd-Wabbo Maddah
