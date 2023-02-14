Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71DDC6963E7
	for <lists+linux-fbdev@lfdr.de>; Tue, 14 Feb 2023 13:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbjBNMvw (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 14 Feb 2023 07:51:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjBNMvv (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 14 Feb 2023 07:51:51 -0500
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC685100
        for <linux-fbdev@vger.kernel.org>; Tue, 14 Feb 2023 04:51:50 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id h19so16326490vsv.13
        for <linux-fbdev@vger.kernel.org>; Tue, 14 Feb 2023 04:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pAU7xw+dVFXFmdNHLGjsQKlgXomgsiet8mw8KgQoRXc=;
        b=NDxTkkMRxE6zo+NOieXw46/M0iM+v0+x3RoAgyOwBJ7RaH3yBZZ+OPKuC911xnJp/g
         VdWSrEXJqL3aICn0BrmHSJTGMKRlpY13K9G2Ws31idMqM/HvkziuhxeUacWKET2pUasb
         p017BIR8H0pTdcpWibxUFzOvoGcpNkJu7fto8EfQFajaLA9/6S4P1bPCp08Erh1NqUKe
         gBYlnjmgES0m3NGpuhbQXx7CRrYjIF61j7kqRSdYgOhrjbX1fHvoDSOTcxvCJpvtdgYn
         tSpbPP1QBiCuGKw2EtFUqkPhIv57BVryQbfpqH6TqxVdXJJnhOh+6gfx6tXdvjucjagL
         rVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pAU7xw+dVFXFmdNHLGjsQKlgXomgsiet8mw8KgQoRXc=;
        b=KKMikXUo2RF8pmINKePRoqLRWIKWpbDFphiMC02/UIFbqdd+wZz8bApN38bGKF18At
         j2EgaC7aZaLODPK2AcsvAMu8XL8l2HVg4WfrIczS9lfzgchJJcnOMq53Zm926SjdSaFN
         6iPQCjHOZQaBBlq4Pqy4MwTRntrJLxdg2SwKqg60CsEan4kVfFkE4A2y9Aw2XNiV080V
         MBj6f6kxdIFRgR8xYPUmHfVqN2OmcmmHPo9qLdAPwH2qGR0uZk+1pxfz7E2gdes5oiT0
         aKI0c1Dw3GlwKLkRM+61vzNMsDIc+TVmWSMBlTK561IQx0YnHr7d7rOoU5EqjC9nNlOx
         h+ow==
X-Gm-Message-State: AO0yUKV9iO6QfmaY2zTzgmlbDvvzQ46+MTu+ievqFI30i5VW/CvP8mB1
        J6jWpzfqb/4iyR//hGyeMx+n3AbHZjJjWSxeR+I=
X-Google-Smtp-Source: AK7set+vB41SInE+/Ww7Uw2sr/cgCHcf9EvyrMmJo4g+ypi1sltpnQeQknwVSHNMtJmh12InAO3ADiBVlGOP5ZLY0NU=
X-Received: by 2002:a67:dd13:0:b0:400:ae22:188 with SMTP id
 y19-20020a67dd13000000b00400ae220188mr419567vsj.1.1676379109908; Tue, 14 Feb
 2023 04:51:49 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:b8af:0:b0:387:97d3:96d7 with HTTP; Tue, 14 Feb 2023
 04:51:49 -0800 (PST)
Reply-To: fionahill.2023@outlook.com
From:   Fiona Hill <ivanroberti700@gmail.com>
Date:   Tue, 14 Feb 2023 04:51:49 -0800
Message-ID: <CAKiAiLAfgVOJo4qCSjgeCytSRoL23vZ7_RJhQzZyuG=v=ERJNQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e34 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5010]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [fionahill.2023[at]outlook.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ivanroberti700[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ivanroberti700[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

-- 
Hello, did you receive my message?
