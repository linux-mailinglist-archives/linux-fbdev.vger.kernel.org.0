Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 113574B4208
	for <lists+linux-fbdev@lfdr.de>; Mon, 14 Feb 2022 07:40:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232503AbiBNGke (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 14 Feb 2022 01:40:34 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232182AbiBNGkd (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 14 Feb 2022 01:40:33 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A5EA56C0A
        for <linux-fbdev@vger.kernel.org>; Sun, 13 Feb 2022 22:40:26 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id e11so10640493ils.3
        for <linux-fbdev@vger.kernel.org>; Sun, 13 Feb 2022 22:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=1RyHqCxoLsTpmMsHtqy/wdC2TroVDxtcrh2h0YEDbOs=;
        b=UzQEykMnnUg1MOl7Vx10+SavZgcPysq5xFhKpf9ek23VomZlATGM6vnfOiLk6rGiL0
         RQ7A2ppOPnHxyfRYcusILjlMXBxZ55poKKQ3vLF0jDyl7A1Au5+OleX0o2cxEaKN9r17
         aNWO3XF6gLafRzaLjbYzbfdrnLry4eCHCGDUQDnL7rcQR3m2Zm2clryG36DF4SROlfix
         0XV840SBhoUvvzVe98mIgZ+eGY5BkTko58uyTnWNLOM18SYfplIitgKNEgqUnb08Nkvq
         C6Dq6UfN/AQHoXWWO5dMs8W7FVRdU6xd36C6HzS1ScMqkbl21BW6lmChYQXEAr6QaXIH
         WQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=1RyHqCxoLsTpmMsHtqy/wdC2TroVDxtcrh2h0YEDbOs=;
        b=cVuUPxY93mvaWNsrtVO9+P2U+p1G/HKcmt27/KTwixTrt/MWbsYY9vu3cqReS2BHas
         4VagFgVizSW+7ap+BnYVOExbsJea9AgQjPr5Ij3KndTu1xPOby8GlSZtb4Qw6x49G2Y5
         kCQsD2ESy+HLNLiB7HV4HEDK3lHTwYAjIy8X1w2H1WFt8Hlhp9MdU+/7XrCskvlvwX/u
         xlS3+5WX+Na/xDehNxxFYR4jXu4UXyBAP8UYIhJCh5HJWAUfe0S9mFfTN5M2FmvqV3LS
         2F2PSOcoYmkZEeUjOh//pw+pIkSahySNKMY7zWpFfjANH4Gb3CKmrsm4Ouzd2MLdk/k7
         Cv5w==
X-Gm-Message-State: AOAM530TtdOWErg8V8W8BuhUOZnKhMyOd2467E5cnKNvQOTK4wOnNl5w
        u+44/loEKLMjE3fIy2eQOSLNBRJOdI+f+bSa4wg=
X-Google-Smtp-Source: ABdhPJx0mzru0Rut3SDn2rYo3EIGSUr40HKfZYn+WoKpVIbk63K4q35O8pkExRmNtld8AwD5Kdzft9vVOz5B2jY++bE=
X-Received: by 2002:a05:6e02:1988:: with SMTP id g8mr2220909ilf.214.1644820825905;
 Sun, 13 Feb 2022 22:40:25 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a4f:2750:0:0:0:0:0 with HTTP; Sun, 13 Feb 2022 22:40:25
 -0800 (PST)
Reply-To: sophiaernest566@gmail.com
From:   Sophia Ernest <drdavidchris500@gmail.com>
Date:   Sun, 13 Feb 2022 22:40:25 -0800
Message-ID: <CAC-V+SOz0zq9fuAUziY4mSSmm87DThFrgyAjkq48-RPC9kkdzQ@mail.gmail.com>
Subject: Greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:12a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4787]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [drdavidchris500[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [sophiaernest566[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [drdavidchris500[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Greetings,

I wonder why you continue neglecting my emails. Please, acknowledge
the receipt of this message in reference to the subject above as I
intend to send to you the details of the mail. Sometimes, try to check
your spam box because most of these correspondences fall out sometimes
in SPAM folder.

Best regards,
Sophia Ernest
