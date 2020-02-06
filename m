Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2044F153EDF
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 Feb 2020 07:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgBFGrN (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 6 Feb 2020 01:47:13 -0500
Received: from smtp4.tjgo.jus.br ([45.71.214.102]:36720 "EHLO mx2.tjgo.jus.br"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727358AbgBFGrN (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 6 Feb 2020 01:47:13 -0500
X-Greylist: delayed 464 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 Feb 2020 01:47:11 EST
Received: from sv-email-p02.tjgo.jus.br (sv-email-p02.tjgo.jus.br [45.71.214.97])
        by mx2.tjgo.jus.br (Postfix) with ESMTPS id 0AAFD2C811C;
        Thu,  6 Feb 2020 03:39:15 -0300 (-03)
Received: from localhost (localhost [127.0.0.1])
        by sv-email-p02.tjgo.ldc (Postfix) with ESMTP id 5EAC463B18;
        Thu,  6 Feb 2020 03:39:13 -0300 (-03)
Received: from sv-email-p02.tjgo.jus.br ([127.0.0.1])
        by localhost (sv-email-p02.tjgo.ldc [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id OFA5DpIqWn1w; Thu,  6 Feb 2020 03:39:13 -0300 (-03)
Received: from localhost (localhost [127.0.0.1])
        by sv-email-p02.tjgo.ldc (Postfix) with ESMTP id 57FB863B46;
        Thu,  6 Feb 2020 03:39:10 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.10.3 sv-email-p02.tjgo.ldc 57FB863B46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tjgo.jus.br;
        s=DB6EB6C0-19CB-11E9-B608-74AECE7D716B; t=1580971150;
        bh=N7ic5LlI94J/87ZUuJbnr2MyW1XAh52HpvlLWUizZd4=;
        h=Date:From:Message-ID:MIME-Version;
        b=bxL2YQO99mAEcG9VRdXH0cSJdCGyxzmr/6YL6vbWCs3LircDL/6k+9+rq3O5gVmCT
         i0S3hqm9wJPuNGluo9r8/xcih2vHdwkTBYpN8RAkTuzQ3LXYLjTM7u3xLMu8SY9qHw
         JjLtebpJrjUZCBh5ncJ+pKQ16+L1JSbBlywadESV2RLrMd0Lm7w9/uRmGifLyYdidJ
         16/NCCwwc0l6Bt2koWNkF5ysbbEyw/23C1jqCjV+7+7/Nigj0GHO+WoZGDrJKwdhid
         xbdNlbo95IzV9tdscBmNDe7Oay8NwTttWeAQaF0zm67YMXvcGtqNWL1Ah8NgdHtt21
         pS3bmdTm9rmow==
X-Virus-Scanned: amavisd-new at sv-email-p02.tjgo.ldc
Received: from sv-email-p02.tjgo.jus.br ([127.0.0.1])
        by localhost (sv-email-p02.tjgo.ldc [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id z75CO-c3Ku-V; Thu,  6 Feb 2020 03:39:10 -0300 (-03)
Received: from sv-email-p00.tjgo.ldc (sv-email-p00.tjgo.ldc [45.71.214.95])
        by sv-email-p02.tjgo.ldc (Postfix) with ESMTP id 69E4A622AF;
        Thu,  6 Feb 2020 03:39:05 -0300 (-03)
Date:   Thu, 6 Feb 2020 03:39:05 -0300 (BRT)
From:   Viviane Jose Pereira <vjpereira@tjgo.jus.br>
Reply-To: Tom Crist <cristtom063@gmail.com>
Message-ID: <583216138.1008677.1580971145365.JavaMail.zimbra@tjgo.jus.br>
Subject: Re:
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [109.70.100.26]
X-Mailer: Zimbra 8.8.15_GA_3829 (zclient/8.8.15_GA_3829)
Thread-Index: aKDUUi76AALHccnOfoakww8dGI9SyA==
Thread-Topic: 
X-HSC-Mail_Inspector-From: vjpereira@tjgo.jus.br
X-HSC-Mail_Inspector-IP: 45.71.214.97
X-HSC-Mail_Inspector-Point: 2
X-HSC-Mail_Inspector-ID: 0AAFD2C811C.AE823
X-HSC-Brasil-HSC_MailInspector: Mensagem OK
X-HSC-Brasil-HSC_MailInspector-SpamCheck: Nao e SPAM,
        HSC MailInspector (cached, Pontuacao=5.168, requerido 6,
        BAYES_00 -3.00, DKIM_VALID_AU -0.10, HELO_NO_DOMAIN 0.00,
        HSC_MAIL_REPUTATION 4.90, LOTS_OF_MONEY 0.00, MISSING_HEADERS 1.02,
        RDNS_NONE 0.79, REPLYTO_WITHOUT_TO_CC 1.55)
X-HSC-Brasil-HSC_MailInspector-SpamScore: 5
X-HSC-Brasil-HSC_MailInspector-From: vjpereira@tjgo.jus.br
X-Spam-Status: No
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org



--=20
Hallo, ich entschuldige mich daf=C3=BCr, dass ich deine Privatsph=C3=A4re g=
est=C3=B6rt habe. Ich kontaktiere Sie f=C3=BCr eine =C3=A4u=C3=9Ferst dring=
ende und vertrauliche Angelegenheit.

Ihnen wurde eine Spende von 15.000.000,00 EUR angeboten Kontakt: cristtom06=
3@gmail.com f=C3=BCr weitere Informationen.

Dies ist keine Spam-Nachricht, sondern eine wichtige Mitteilung an Sie. Ant=
worten Sie auf die obige E-Mail, um immer mehr Informationen =C3=BCber die =
Spende und den Erhalt von Geldern zu erhalten.
