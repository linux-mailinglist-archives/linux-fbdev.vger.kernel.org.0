Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3879744B01
	for <lists+linux-fbdev@lfdr.de>; Sat,  1 Jul 2023 22:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjGAUFU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 1 Jul 2023 16:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjGAUFT (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Sat, 1 Jul 2023 16:05:19 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD7781999
        for <linux-fbdev@vger.kernel.org>; Sat,  1 Jul 2023 13:05:18 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b69923a715so48325921fa.0
        for <linux-fbdev@vger.kernel.org>; Sat, 01 Jul 2023 13:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688241917; x=1690833917;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=On9FXbz/4p6uZeLAq7sP25Q5Nd8OJiKjb1ZpXex+CRI=;
        b=iGilhQpN+Xp9qjblubJi7hO9s7jYESrw9G9iOnn8wlZP5fEU0Mink+bJuD5itJ/HuO
         w2Q2h1gr2Y+TdwfDfHAFJwCmji8UV7M8SRY5/qmF+TvzpbkrpLR4NhJQzFnR/q3gP8PR
         nAdfhmRsLbBqF6t5Tbyl6a8gPfrGsR5wfAxiVQ0TVEzKq4S3zsDa8f+8EsdUOXd5l0lX
         pvZYwQFQ835oCkCWc1fnPIKdXCNxNs+eZWLrQCyW76dchCVpWK5C80KzrzBUIfhe8dML
         NMdWE2uv4Im3eFYsQL/uSbwnKmIPZ8mZyJoVS4dbIrHczrl+b6hijhh03OYbkAsW2FBQ
         DM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688241917; x=1690833917;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=On9FXbz/4p6uZeLAq7sP25Q5Nd8OJiKjb1ZpXex+CRI=;
        b=Jb7yAvDpscSxXAUiaukwDyLGLl3/JNcpD+6CFHPBalwKXaynv5ZUJGR8AY0rW64Qny
         w5B0CQWyujLqPC+nmtJXFMaaQf6YXjx9cd+fKMKsia/j4zEA0nxCy+fVD/cDD86TMa8+
         HFVFceaJntQogMhuWazBBACqhN/nFBNcNiJEksYTQXynawEuWBSSpIW9vjCzFcKKIcd3
         tSey3FAd92tH6pW6K6Lp18EbHQB9ydVvdNJb+Vn2Vm46PfBT0C6p4hvNANHK7FoXQa/6
         VCygq6PY1h/6E+12V7P46iziENuudnnBfrJPDIrMfJ9wcz1mTZo+7qfvEGlnr6NmZCrZ
         IBCA==
X-Gm-Message-State: ABy/qLZQHu2CUPcuhkcaG9GWlkrYLhCymOM2ju2ApOeawz+U9RRzRWhc
        Wf1vU+h0Srju/muxlWTSx9oY3u8k4H3YO+4a0Lc=
X-Google-Smtp-Source: APBJJlEt4T835SYvN3Y5ck7fL9F3cwXhmszGaPDCg/bxiFY2At5sneRZ0hcc8WoDALZLuUNa/WnJ64McvVX5OD4/Qb0=
X-Received: by 2002:a2e:9209:0:b0:2b4:490a:66b7 with SMTP id
 k9-20020a2e9209000000b002b4490a66b7mr4826097ljg.12.1688241916422; Sat, 01 Jul
 2023 13:05:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:2e0b:0:b0:2b6:d63d:cc29 with HTTP; Sat, 1 Jul 2023
 13:05:15 -0700 (PDT)
Reply-To: osbornemichel438@gmail.com
From:   John T <lmas93352@gmail.com>
Date:   Sat, 1 Jul 2023 21:05:15 +0100
Message-ID: <CAJvcsdew8WJRp8p+2NFvK99F8MuWXDpOQBqT4d8jv8wA8c4BsA@mail.gmail.com>
Subject: Hallow und wie geht es dir heute?
To:     osbornemichel438@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.8 required=5.0 tests=ADVANCE_FEE_2_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MONEY_FORM_SHORT,
        MONEY_FRAUD_3,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hallow und wie geht es dir heute?

Ich m=C3=B6chte, dass Ihre Partnerschaft Sie als Subunternehmer
pr=C3=A4sentiert, damit Sie in meinem Namen 8,6 Millionen US-Dollar aus
=C3=9Cberrechnungsvertr=C3=A4gen erhalten k=C3=B6nnen, die wir zu 65 % und =
35 %
aufteilen k=C3=B6nnen.

Diese Transaktion ist 100 % risikofrei; Du brauchst keine Angst zu haben.

Bitte senden Sie mir eine E-Mail an (osbornemichel438@gmail.com), um
ausf=C3=BChrliche Informationen zu erhalten und bei Interesse zu erfahren,
wie wir dies gemeinsam bew=C3=A4ltigen k=C3=B6nnen.

Sie m=C3=BCssen es mir also weiterleiten
Ihr vollst=C3=A4ndiger Name.........................
Telefon.............
Geburtsdatum .........................
Staatsangeh=C3=B6rigkeit .................................

Mit freundlichen Gr=C3=BC=C3=9Fe,
Osborne Michel.

Hallow and how are you today?

I seek for your partnership to present  you as a sub-contractor so
that you can receive 8.6M Over-Invoice contract fund on my behalf and
we can split it 65% 35%.

This transaction is 100% risk -free; you need not to be afraid.

Please email me at ( osbornemichel438@gmail.com ) for comprehensive
details and how we can handle this together if interested.

So I need you to forward it to me
your full name.........................
Telephone.............
Date of  Birth .........................
Nationality .................................

Kind Regards,
Osborne Michel.
