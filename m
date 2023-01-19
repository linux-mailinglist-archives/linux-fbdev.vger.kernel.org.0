Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C638673DEC
	for <lists+linux-fbdev@lfdr.de>; Thu, 19 Jan 2023 16:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbjASPtt (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 19 Jan 2023 10:49:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbjASPtR (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 19 Jan 2023 10:49:17 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D78708758B
        for <linux-fbdev@vger.kernel.org>; Thu, 19 Jan 2023 07:48:11 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so1594921wmq.0
        for <linux-fbdev@vger.kernel.org>; Thu, 19 Jan 2023 07:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=SmzMUzwoLkvlVGy+BLrKpUL90vuQ/Du4wcaIfwpFEvnqT+Pr0XrAwkWii0TgOBP52q
         J98pVDlCvVTDZN6u2+N5L8nzRV1PSZBA8C7RqTEXEaatDbgg+luSvmTm2YXbD2qEvejK
         iFaKvKwM3xp3NBlNPR6n/F+OVmkl6HYRpXPBTDyQ58bddi1jG+rVw2LAOeTPxyiHyd+a
         bpUEH1jy3oUDMoQ/BAWSN/PJ2IfPrxBI8h7KPEhm8ldrGzvxyTECqRTIiCUxINwgjW4y
         EGICs/pgdu347jL8KPCuO+KgScYwPsgoczZWG+Zbw9bF2O37Znoeo3fnvdliFW/siayx
         N3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=qD6xq4hjrtkD+Lv5W+eZT6uESpDfld6V2MtRPKLuQ6BcxEsd5QLzJ6L2Y5sWS5Kv3q
         ZoOe7G/pf9duIpzrzJADjgRIZUMKk8ywBYeI0vgOJ9KYhaRoAMuwV3Viaq+y/8lWEyPy
         072nuSd8ZonBPqyitAFUBOqMoRjfG+PaxvKw39PhM+rPexLzhS5tsZAvBp4mOU/EegFC
         9U/seKVXBmANRwtGGQKOPphWgqd+5pCZKAwcu4uJ3jG1bw/fTnr6z2dVn6gz7N3P4kke
         IlIoYIWvescie1SJNzWyXUO9om5rz2X01Dl/+UU2g8IdnQp7PR+NDJGyzd08ZVtJUH+v
         CQ5g==
X-Gm-Message-State: AFqh2kov4fslb1qkruY9XvPVwC6hZNgSKTnKS5InJMQK/ndxtr1S3R1Q
        0tfdrxlonMAmWWIFZsYJH/sHZ8hVUliS4ll9xXE=
X-Google-Smtp-Source: AMrXdXs8v4C0pTf+LRKpZGBBMmWiYeGk2ezj1yrI0a1O7mnMMoMDOf1ZCoVMQCoqCoR8D1dJF3jM3eA74y4O2pVquZE=
X-Received: by 2002:a05:600c:180a:b0:3d0:a089:4d6b with SMTP id
 n10-20020a05600c180a00b003d0a0894d6bmr668230wmp.78.1674143288731; Thu, 19 Jan
 2023 07:48:08 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:adf:ed86:0:0:0:0:0 with HTTP; Thu, 19 Jan 2023 07:48:08
 -0800 (PST)
Reply-To: kl145177@gmail.com
From:   Ken Lawson <i41600633@gmail.com>
Date:   Thu, 19 Jan 2023 15:48:08 +0000
Message-ID: <CAMue4Qiw0JmxokqafCi91iqvBLVZVpynnZLRp4V5bqFyUPCu7Q@mail.gmail.com>
Subject: =?UTF-8?B?RG9icsO9IGRlbiwgc3TDoWxlIG/EjWVrw6F2w6FtIFZhxaFpIG9kcG92xJvEjy4=?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,EMPTY_MESSAGE,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:335 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4984]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [i41600633[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [kl145177[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [i41600633[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  2.3 EMPTY_MESSAGE Message appears to have no textual parts
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


